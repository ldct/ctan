<%@ LANGUAGE = VBScript%>
<%
' Copyright 2003 D. P. Story
' All Rights Reserved
' See eq2dbman.pdf for some documentation

' NOTICE: This program can redistributed and/or modified under 
' the terms of the LaTeX Project Public License        
' Distributed from CTAN archives in directory          
' macros/latex/base/lppl.txt; either version 1 of the  
' License, or (at your option) any later version.      

' This script is offered "as is", no guarantees are extended.
' eqRecord should be extensively tested on your own system
' until you are satisified with its functionality and
' reliability.  

Response.buffer = True

Dim DebugTxt, DebugFDF
Dim ErcStatus : ErcStatus = "Problems Reported: "
Dim dotReplace : dotReplace = "_"
DebugTxt = 0
DebugFDF = 0

If DebugTxt Then
    Response.ContentType = "text/html"
Else
    Response.ContentType = "application/vnd.fdf"
End If

On error Resume Next

Rem Create an FDF object
Set FdfAcx = Server.CreateObject("FdfApp.FdfApp")
Set FDFout = FdfAcx.FDFCreate

Rem Parse Incoming Data
Set FDFin = FdfAcx.FDFOpenFromBuf (Request.BinaryRead(Request.TotalBytes))

Rem Declare some variables
Dim cBuf, cDbName, cTableName, cQuiz
Dim cTime : cTime = Now

' Get Required info
cDbName = FDFin.FDFGetValue("dbName")
cTableName = FDFin.FDFGetValue("dbTable")
cQuiz = FDFin.FDFGetValue("quizName")

Rem Query the database
On error Resume Next
Set DataConn = Server.CreateObject("ADODB.Connection")
' DataConnConnecString = cDbName 
DataConn.Open cDbName
Set RecSet = Server.CreateObject("ADODB.Recordset")
RecSet.CursorType = 1
RecSet.LockType = 2
RecSet.ActiveConnection = DataConn
RecSet.Source=cTableName
DataConn.BeginTrans
RecSet.Open

If Err.Number <> 0 Then
    If DebugTxt Then
        Response.Write "Problems opening database<br>"
    End If
End If

RecSet.AddNew

On error Resume Next
RecSet("quizName") = cQuiz
If Err.Number <> 0 Then
    If DebugTxt Then
        Response.Write "Problems storing quizName." &"<br>"
    End If
    Err.Clear
End If
If DebugTxt Then 
    Response.Write "dbName: " & cDbName & "<br>"
    Response.Write "quizName = " & cQuiz &"<br>"
End If

RecSet("TimeOfQuiz") = cTime
If Err.Number <> 0 Then
    If DebugTxt Then
        Response.Write "Problems storing time, possibly no TimeOfQuiz field" &"<br>"
    End If
    Err.Clear
End If


Dim currentField, dbCurrentField, currentValue, parent
currentField = FDFin.FDFNextFieldName("")

Do
    ' check for dots
    position = InStr(1,currentField, ".",0)
    ' We save only fields that have hierarchial names: In particular,
    ' we save fields with parent root of cQuiz or IdInfo.
    If position <> 0 Then
        parent = Trim(Mid(currentField,1,position-1))
        If (parent = cQuiz) or (parent = "IdInfo") Then
            If DebugTxt Then Response.Write "currentField: " & currentField & "<br>"
            ' strip off parent name, and replace "." with dotReplace
            dbCurrentField = Replace(currentField, ".", dotReplace, position+1,-1,0)
            If DebugTxt Then Response.Write "dbCurrentField: " & dbCurrentField & "<br>"

            On error Resume Next
            currentValue = FDFin.FDFGetValue(currentField)
            If DebugTxt Then Response.Write "currentValue: " & currentValue & "<br>"

            If Err.Number <> 0 Then
                ReportError(Err)
                DebugMsg "Field Name: ",currentField
                Err.Clear
                currentValue = ""
            Else
                On error Resume Next
                RecSet(dbCurrentField) = currentValue
                If Err.Number <> 0 Then
                    If DebugTxt Then
                        Response.Write "dbCurrentField: " & dbCurrentField&"<br>"
                        Response.Write "currentValue: " & currentValue&"<br>"
                        Response.Write "Error Number: " & Err.Number&"<br>"
                        Response.Write "Descripton: " & Err.Description&"<br>"
                        Err.Clear
                    End If
                    If DebugFDF Then
                        StatusErcMsg = StatusErcMsg & " Could "_
                        &" not Update the DB field, '"_
                        &dbCurrentField&"', using "_
                        &"the value from the form field, '"_
                        &currentField&"'." & Err.Description &" "
                    End If
                    ' Ignore the error
                    Err.Clear
                End If
            End If
        End If
    End If
    On error Resume Next
    currentField = FDFin.FDFNextFieldName(currentField)
    If currentField = "" Or Err.Number <> 0 Then Exit Do
Loop

If  DataConn.Errors.Count > 0 Then
    If DebugTxt Then
        For each Error in DataConn.Errors
            Response.Write "Error Number: " & Error.Number &"<br>"
            Response.Write "Error Description: " & Error.Description &"<br>"
        Next
    End If
    DataConn.CancelUpdate
    DataConn.RollbackTrans
    CancelTableList = CancelTableList &", " & tableName
Else
    On error Resume Next
    RecSet.Update

    If  (Err.Number <> 0) OR (DataConn.Errors.Count > 0) Then
        If DebugTxt Then
            If Err.Number <> 0 Then Response.Write "Update Failed: " : ReportError(Err)
            For each Error in DataConn.Errors
                Response.Write "After update: Error Number: " & Error.Number &"<br>"
                Response.Write "Error Description: " & Error.Description &"<br>"
            Next
        End If
        DataConn.CancelUpdate
        DataConn.RollbackTrans
        cBuf = "There were some problems saving."
    Else
        DataConn.CommitTrans
        cBuf = "Your quiz results were successfully saved at " & cTime & "."
    End If
End If

If DebugFDF Then cBuf = cBuf & " " & ErcStatus

FDFout.FDFSetStatus cBuf

' Send back to the browser
Response.BinaryWrite FDFout.FDFSaveToBuf

RecSet.Close
Set RecSet = Nothing
DataConn.Close
Set DataConn = Nothing
FDFin.FDFClose
FDFout.FDFClose
Set FdfAcx = Nothing
Set FDFin = Nothing
Set FDFout = Nothing

Sub RecordError(field)
    If Err.Number <> 0 And DebugFDF Then
        ErcStatus = ErcStatus & " "&field&": " & Err.Description
    End If
    If Err.Number <> 0 And DebugTxt Then
        Response.Write "Set Error: "&field&": " & Err.Description & "<br>"
    End If
    Err.Clear
End Sub

Sub ReportError(ByRef localErr)

    DebugMsg "Err.Description: ", localErr.Description
    DebugMsg "Err.Number: ", localErr.Number
    localErr.Clear

End Sub

Sub DebugMsg(myText, myEval)
    If DebugTxt Then Response.Write myText & myEval &"<br>"
End Sub
%>

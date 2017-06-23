<%@ LANGUAGE = VBScript%>
<%
' eqText.asp
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
DebugTxt = False
DebugFDF = False

' Send FDF file
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
Dim cBuf, cQuiz
Dim cTime : cTime = Now

'\eqSubmit{http://localhost/scripts/eqText.asp\#FDF}{c:/Inet/DB/myLog.txt}{Math101}

Dim cPathToTxtFile, dbRecord

' Get Required info
cPathToTxtFile = FDFin.FDFGetValue("pathToTxtFile")
cCourseName = FDFin.FDFGetValue("courseName")
cQuiz = FDFin.FDFGetValue("quizName")

' dbRecord is a tab delimited string of the quiz record
dbRecord = cCourseName & vbTab & cQuiz & vbTab & cTime

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
            Else
                On error Resume Next
                dbRecord = dbRecord & vbTab & dbCurrentField & ": " & currentValue
            End If
        End If
    End If
    On error Resume Next
    currentField = FDFin.FDFNextFieldName(currentField)
    If currentField = "" Or Err.Number <> 0 Then Exit Do
Loop

If DebugFDF Then cBuf = cBuf & " " & ErcStatus


If DebugTxt Then 
    Response.Write "cPathToTxtFile: " & cPathToTxtFile & "<br>"
    Response.Write "dbRecord: " & dbRecord & "<br>"
End If    

' Let's write to a log file
Dim logFileObj, logFile
Set logFileObj = CreateObject("Scripting.FileSystemObject")
Set logFile = logFileObj.OpenTextFile(cPathToTxtFile, 8, True)
logFile.WriteLine dbRecord
logFile.Close
Set logFileObj = Nothing

cBuf = "Quiz results successfully saved!"
FDFout.FDFSetStatus cBuf

' Send back to the browser
Response.BinaryWrite FDFout.FDFSaveToBuf

FDFin.FDFClose
FDFout.FDFClose
Set FdfAcx = Nothing
Set FDFin = Nothing
Set FDFout = Nothing
%>

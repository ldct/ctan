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
' 
' Note: You need to edit one line below. Search this file for the line that
' contains the string "mySMTP". Replace this string with your SMTP server.

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

'\eqSubmit{http://localhost/scripts/eqMail.asp\#FDF}{eqQuiz}{Math101}

Dim eqMail, cMailTo, cMailFrom, strMessage, eqTab, eqCR
eqTab = chr(9) 
eqCR = chr(10)

' Get Required info
cMailTo = FDFin.FDFGetValue("mailTo")
cMailFrom = cMailTo
cCourseName = FDFin.FDFGetValue("courseName")
cQuiz = FDFin.FDFGetValue("quizName")

strMessage = "Course Information"
strMessage = strMessage & eqCR & eqTab & "Course Name: " & cCourseName
strMessage = strMessage & eqCR & eqTab & "Quiz: " & cQuiz
strMessage = strMessage & eqCR & eqTab & "TimeOfQuiz: " & cTime
strMessage = strMessage & eqCR & eqCR  & "Student Results"

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
                strMessage = strMessage & eqCR & eqTab & dbCurrentField & ": " & currentValue
            End If
        End If
    End If
    On error Resume Next
    currentField = FDFin.FDFNextFieldName(currentField)
    If currentField = "" Or Err.Number <> 0 Then Exit Do
Loop

If DebugFDF Then cBuf = cBuf & " " & ErcStatus

cBuf = "Quiz results successfully sent to your instructor!"
FDFout.FDFSetStatus cBuf

' Send back to the browser
Response.BinaryWrite FDFout.FDFSaveToBuf

FDFin.FDFClose
FDFout.FDFClose
Set FdfAcx = Nothing
Set FDFin = Nothing
Set FDFout = Nothing

' Construct and send e-mail
' CDONTS
'Set eqMail = Server.CreateObject("CDONTS.NewMail")
'eqMail.To = cMailTo
'position = InStr(1,cMailFrom,",",0)
'If position <> 0 Then
'    cMailFrom = Trim(Mid(cMailFrom,1,position-1))
'End If
'eqMail.From = cMailFrom
'' eqMail.BCC = "dpstory@uakron.edu"
'eqMail.Subject = "Quiz Results: " & cQuiz & " of " & cCourseName
'eqMail.Body = strMessage
'eqMail.Send
'Set eqMail = Nothing

' Construct and send e-mail
' CDOSYS
Set eqMail = Server.CreateObject("CDO.Message")
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "mySMTP"
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
' eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 0 
eqMail.Configuration.Fields.Update

eqMail.To = cMailTo
' See if there is a comma in the cMailFrom string, if yes, then we have multiple address
' that we are sending to. We extract the first e-mail address as the one we will put in
' the eqMail.From address.
position = InStr(1,cMailFrom,",",0)
If position <> 0 Then cMailFrom = Trim(Mid(cMailFrom,1,position-1))
eqMail.From = cMailFrom
' Modify the subject to meet your needs
eqMail.Subject = "Quiz Results: " & cQuiz & " of " & cCourseName
eqMail.TextBody = strMessage
eqMail.Send
Set eqMail = Nothing

If DebugTxt Then
    Response.Write strMessage
End If

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

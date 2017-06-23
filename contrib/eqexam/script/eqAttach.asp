<%@ LANGUAGE = VBScript%>
<%
' Copyright 2005 D. P. Story
' All Rights Reserved
' See eqexamman.pdf for some documentation

' NOTICE: This program can redistributed and/or modified under
' the terms of the LaTeX Project Public License
' Distributed from CTAN archives in directory
' macros/latex/base/lppl.txt; either version 1 of the
' License, or (at your option) any later version.

' This script is offered "as is", no guarantees are extended.
' eqRecord should be extensively tested on your own system
' until you are satisfied with its functionality and
' reliability.
'
' Note: You need to edit one line below. Search this file for the line that
' contains the string "mySMTP". Replace this string with your SMTP server.

Response.buffer = True

Dim DebugTxt, DebugFDF
Dim ErcStatus : ErcStatus = "Problems Reported: "
DebugTxt = False
DebugFDF = False

' Send FDF file
If DebugTxt Then
    Response.ContentType = "text/html"
    Response.Write "Debug Info" & "<br>"
Else
    Response.ContentType = "application/vnd.fdf"
End If

On error Resume Next

Dim silentMode : silentMode = False
Dim stripPath : stripPath = False

If Request.QueryString("silent").Count > 0 Then silentMode = True
If Request.QueryString("nopath").Count > 0 Then stripPath = True

Rem Create an FDF object
Set FdfAcx = Server.CreateObject("FdfApp.FdfApp")
Set FDFout = FdfAcx.FDFCreate

Rem Parse Incoming Data
Set FDFin = FdfAcx.FDFOpenFromBuf (Request.BinaryRead(Request.TotalBytes))

Dim cPDFPath, pos

If stripPath Then
    If DebugTxt Then Response.Write "stripPath is true " & "<br>"
    cPDFPath = FDFin.FDFGetFile
    pos = InStrRev( cPDFPath, "/")
    If pos <> 0 Then
        If DebugTxt Then Response.Write "pos = " & pos & "<br>"
        cPDFPath = Mid(cPDFPath, pos + 1, Len(cPDFPath) - pos )
        If DebugTxt Then Response.Write "cPDFPath = " & cPDFPath & "<br>"
        FDFin.FDFSetFile cPDFPath
    End If
End If

Rem Declare some variables
Dim cBuf
Dim cTime : cTime = Now
Dim eqMail, cMailTo, cMailFrom, cMailSubject
Dim cCourseName, cExam, cStudent, cSID, strMessage, cRetnMsg, eqTab, eqCR
eqTab = chr(9)
eqCR = chr(10)

' Get Required Info -------------------
' The only thing we really need is the email address to send this data to
cMailTo = FDFin.FDFGetValue("IdInfo.mailTo")
' cMailFrom = cMailTo

' Get Optional Info ------

On error Resume Next
cCourseName = "" : cCourseName = Trim(FDFin.FDFGetValue("IdInfo.courseName"))

On error Resume Next
cExam = "" : cExam = Trim(FDFin.FDFGetValue("IdInfo.examName"))

On error Resume Next
cStudent = "" : cStudent = Trim(FDFin.FDFGetValue("IdInfo.Name"))

On error Resume Next
cSID = "" : cSID = Trim(FDFin.FDFGetValue("IdInfo.SID"))

On error Resume Next
cMailFrom = "" : cMailFrom = Trim(FDFin.FDFGetValue("IdInfo.email"))
If Trim(cMailFrom) = "" Then cMailFrom = cMailTo

On error Resume Next
cMailSubject = "" : cMailSubject = FDFin.FDFGetValue("IdInfo.subject")
If Trim(cMailSubject) = "" Then cMailSubject = "Exam Results: "  & cExam & " of " & cCourseName

On error Resume Next
cRetnMsg = "" : cRetnMsg = Trim(FDFin.FDFGetValue("IdInfo.retnmsg"))

strMessage = "Summary Information:"
If cCourseName <> "" Then strMessage = strMessage & eqCR & eqTab & "Subject: " & cCourseName
If cExam <> "" Then strMessage = strMessage & eqCR & eqTab & "Title: " & cExam
If cStudent <> "" Then strMessage = strMessage & eqCR & eqTab & "Name: " & cStudent
strMessage = strMessage & eqCR & eqTab & "TimeOfQuiz: " & cTime

If Trim(cRetnMsg) = "" Then
    cBuf = "Exam results successfully sent to your instructor!"
Else
    cBuf = cRetnMsg
End If

If DebugFDF Then cBuf = cBuf & " " & ErcStatus

If Not silentMode Then FDFout.FDFSetStatus cBuf

' Construct and send e-mail

'CDONTS
' Set eqMail = CreateObject("CDONTS.NewMail") 'cdots

' CDOSYS
Set eqMail = Server.CreateObject("CDO.Message")
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "mySMTP"
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
' eqMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 0
eqMail.Configuration.Fields.Update

eqMail.To = cMailTo
' See if there is a comma in the cMailFrom string, if yes, then we have multiple addresses
' that we are sending to. We extract the first e-mail address as the one we will put in
' the eqMail.From address.
position = InStr(1,cMailFrom,",",0)
If position <> 0 Then cMailFrom = Trim(Mid(cMailFrom,1,position-1))
eqMail.From = cMailFrom
eqMail.Subject = cMailSubject

' CDOSSYS or CDONTS
eqMail.TextBody = strMessage
' eqMail.Body = strMessage 'cdots

Dim strTempFile
Dim strTempFolder
Dim strTemp
Dim fso

Set fso = CreateObject("Scripting.FileSystemObject")
Set strTempfolder = fso.GetSpecialFolder(2)
strTempFile = fso.GetTempName()
strTempFile = left(strTempFile, len(strTempFile)-4)
strTemp =  strTempFolder & "\" & strTempFile & ".fdf"
FDFin.FDFSaveToFile strTemp

If DebugTxt Then Response.Write "strTemp = " & strTemp & "<br>"

' CDOSSYS or CDONTS
eqMail.AddAttachment strTemp
' eqMail.AttachFile strTemp 'cdots

eqMail.Send
Set eqMail = Nothing
' Send back to the browser
Response.BinaryWrite FDFout.FDFSaveToBuf

' Delete temporary file
fso.DeleteFile strTemp
Set fso = nothing

FDFin.FDFClose
FDFout.FDFClose
Set FdfAcx = Nothing
Set FDFin = Nothing
Set FDFout = Nothing

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

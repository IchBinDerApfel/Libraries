;<<< ░░ ░░░▄ ░░░░░░░░░   ▄ 
;░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌ 
;░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐ 
;░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ 
;░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ 
;░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ 
;░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌ 
;░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ 
;░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ 
;░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ 
;▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐ 
;▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌ Wow. Such Code.
;▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ 
;░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌ 
;░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐ 
;░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌ 
;░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ 
;░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄—

{
;~ #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;~ User = % Username
SetMouseDelay,-1
AutoTrim, On
#SingleInstance force
Sendmode, input
Setkeydelay, 0
#WinActivateForce
DetectHiddenText, On
Coordmode, Relative
#Include IELib.ahk
}

URLDownloadToFile, http://soundbible.com/grab.php?id=1919&type=wav, C:\Users\%username%\Desktop\mp3.wav
		URLDownloadToFile, https://i0.wp.com/digiday.com/wp-content/uploads/2014/04/explode.gif?resize=1440`%2C459&ssl=1, C:\Users\%Username%\Desktop\wat.gif
URLDownloadToFile, https://mischellaneous.files.wordpress.com/2016/09/pistachio-1.png?w=233&h=374, C:\Users\%Username%\Desktop\wat2.png
Loop
	ifexist, C:\Users\%Username%\Desktop\wat2.png
		break

Loop, 1
{	



Sleep, 500

{


Soundset, 20
ComObjCreate("SAPI.SpVoice").Speak("It looks a bit like this")

Gui, Destroy
Gui, Color, EEAA99  ; Can be any RGB color (it will be made transparent below).
h:= A_ScreenHeight  - 120
Gui +LastFound +E0x20 +ToolWindow +LastFound -Caption +ToolWindow
Gui, Add, Picture, +Background +0x4000000 c000000 w60 h120 , C:\Users\%Username%\Desktop\wat2.png
Loop, 14
Gui, Add, Picture, +Background +0x4000000 c000000 w60 h120 X+4, C:\Users\%Username%\Desktop\wat2.png
Gui, Show, y%h%
WinSet, TransColor, EEAA99

Soundset, 20
ComObjCreate("SAPI.SpVoice").Speak("Then it looks like this")


Gui 2: Color, EEAA99  ; Can be any RGB color (it will be made transparent below).
h = 0
Gui 2: +LastFound +E0x20 +ToolWindow +LastFound -Caption +ToolWindow
Gui 2: Add, Picture, +Background +0x4000000 c000000 w60 h120 , C:\Users\%Username%\Desktop\wat2.png
WinSet, TransColor, EEAA99
Loop
{
	h += 1
	
Gui 2: Show, y%h%
if (h >= (A_ScreenHeight - 50))`
	break
}

Gui, Destroy
Gui 2: Destroy

var = C:\Users\%Username%\Desktop\wat.gif  ;location of gif you want to show			; Gif #2
gui, +alwaysontop 
gui, -caption +toolwindow +alwaysontop
;~ gui, color, ffffff
gui, margin, 0, 0

Gui, Add, ActiveX, x0 y0 h459 w1440 vWB, shell explorer
wb.Navigate("about:blank")
html := "<html>`n<title>name</title>`n<body>`n<center>`n<img src=""" var """ >`n</center>`n</body>`n</html>"
wb.document.write(html)
Soundset, 50
h:= A_ScreenHeight - 459
Gui, show, Y%h%
Soundplay, C:\Users\%username%\Desktop\mp3.wav
Sleep, 1200
Gui, Destroy

Filedelete, C:\Users\%username%\Desktop\mp3.wav
FileDelete, C:\Users\%Username%\Desktop\wat.gif
FileDelete, C:\Users\%Username%\Desktop\wat2.png
	}
}

Sleep, 500



ExitApp

	




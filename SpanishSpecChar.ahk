﻿
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

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Opening Guff
{
Menu, Tray, Icon, glogoo1.png
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
}

;------------------------------------------------------------------------------------------------------------------------------------------------------------------
Gui, Add, Picture, x150 y00 w120 h120,glogoo1.png
Gui, Add, Text, x12 y10 w150 h30 , Spanish SpecChr is running.
Gui, Show, w239 h52, SpecChr.
WinMinimize, SpecChr.ahk, ,SpecChr.ahk
return

GuiClose:
MsgBox, 0, , Goodbye, 1
ExitApp

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!A::
If (GetKeyState("CapsLock", "T") = 1)    ; Looks to see if CapsLock is ON
	Send, % chr(193)
else  if (GetKeyState("CapsLock", "T") = 0)    ; Looks to see if CapsLock is OFF
	Send, % chr(225)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!E::
If (GetKeyState("CapsLock", "T") =1)
	Send, % chr(201)
else if (GetKeyState("CapsLock", "T") =0)
	Send, % chr(233)
Return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!I::
If (GetKeyState("CapsLock", "T") =1)
	Send, % chr(205)
Else if (GetKeyState("CapsLock", "T") =0)
	Send, % chr(237)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!O::
If (GetKeyState("CapsLock", "T") =1)
	Send, % chr(211)
Else if (GetKeyState("CapsLock", "T") =0)
	Send, % chr(243)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!U::
If (GetKeyState("CapsLock", "T") =1)
	Send, % chr(218)
Else if (GetKeyState("CapsLock", "T") =0)
	Send, % chr(250)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!N::
If (GetKeyState("CapsLock", "T") = 1)
	Send, % chr(209)
Else if (GetKeyState("CapsLock", "T") = 0)
	Send, % chr(241)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!1::
Send, % chr(161)
Return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------

^!/::
Send % chr(191)
return

;------------------------------------------------------------------------------------------------------------------------------------------------------------------




















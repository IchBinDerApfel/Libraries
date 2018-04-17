#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.







^K:: 
{
	i = 0
	;~ P = 16
  
Gui, Font, S8 CDefault, 
Gui, Add, Text, x05 y0 w500 h0 ,
gui,add,text,vtext w920
settimer,progress,1
sysget, var_, monitorworkarea ; gets the actual monitor work area for the specific system you're running.
x := (var_right-920) ; sets the opening location of the gui's X axis
y := (var_bottom-50) ; sets the opening location of the gui's Y axis

gui, show, x%x% y%y%, Pi ; show dat bish
;~ Gui, Show, w920 h50, 
return
progress:
i += 1
;~ loop, %i%
	;~ P *= 16

SetFormat, float, .150 ; sets the visible decimal place to be shown in the gui
D := 4*aTan(1) ; finds the arctangent of 1 which is equal to Pi
Pi:= i*Sin(D/i) ; calculates Pi by using the integer multiplied by the Sine of Pi divided by our integer "i"
;~ percent := 1*percy

guicontrol,,text,%Pi% 
return
} 

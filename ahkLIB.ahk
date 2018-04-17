
; ******************************************************************
; * |---| |  | ---    |  | --- --- |---| \   /    - -  --  |\  --- *
; *   |   |__| |_     |\ |  |  |_    |    \ /    /    /  \ | | |_  * 
; *   |   |  | |      | \|  |  |     |     |     \    \  / | | |   * 
; *   -   |  | ---    |  | --- |     -     |      - -  --  |/  --- *   
; ******************************************************************                                                 

; *************************************************************************************************************************************************
; *                                                                                                                                               *
; *   WELCOME TO THE LIBRARY OF NIFTY CODES. HERE YOU WILL FIND BITS OF USEFUL AND OBSCURE SETS OF CODE TO ASSIST YOU IN FUTURE CODING ENDEAVORS. *
; *                                                                                                                                               *
; *************************************************************************************************************************************************




{    ; ||AUTHOR'S SIGNATURE||
	
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
}

{    ; ||STANDALONE OPENING GUFF CODES||
	
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Menu, Tray, Icon, ;[FileName]    ; Changes the icon from the green box with an "H" to whatever image that is called to
User = % Username
User = % A_UserName
SetMouseDelay,-1
AutoTrim, On
Setkeydelay, 0     
#WinActivateForce
DetectHiddenText, On
DetectHiddenWindows, On
Coordmode, Relative
#Persistent
SetFormat float, 0.2
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir% 
global oWorkbook ; global var to utilize in external functions
global Time
global Scan
global w
global ie
w = 0
Time = 0
oWorkbook := ComObjGet(MDR.xlsx) ; sets up the closed workbook to be read while closed?	
}	

{    ; ||CODING THAT CHECKS FOR CAPS LOCKS||
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
If (GetKeyState("CapsLock", "T") = 1)    ; Looks to see if CapsLock is ON
	Send, % chr(196)
else  if (GetKeyState("CapsLock", "T") = 0)    ; Looks to see if CapsLock is OFF
	Send, % chr(228)
return	
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
}	

{    ; ||GUI CODES AND DESCRIPTIONS||
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
Gui, +Resize    ; Enables GUI resizing
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
gui, -SysMenu    ; Removes the Exit Button and Minimize Button from the GUI window
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
gui, +AlwaysOnTop    ; Makes the GUI remain on top of other windows
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
Gui, New    ; Prevents GUI Fusion
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
Gui, Add, ListBox, x32 y40 w310 h480 vlb1 gaddItem, % arrayToString(list1,1)    ; example of creating a listbox that calls to an array
Gui, Add, ListBox, x382 y40 w310 h472 vlb2, % arrayToString(list2)              ; example of creating a listbox that calls to an array
list1 := []    ; Array for listbox examples. What you want listed will go in between [ and ]
list2 := []
		
		
	;    Used to add item from 1 listbox to another	
addItem:
GuiControl, enable, lb2
gui,submit,nohide
list2.insert(RegExReplace(lb1,"^\d+\.\s",""))
guicontrol,,lb2,|
guicontrol,,lb2, % arrayToString(list2)
return 
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	;    If I remember correctly, this code adds a numerical value to the items in an original listbox when two exist.
arrayToString(a,numbered=0) {           
	s := ""
	loop % a.length() {
		s .= (a_index > 1 ? "|" : "") (numbered ? a_index ". " : "") a[a_index]
	}
return S
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
}	
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	;    GUI Magnets
{
WinGetPos, guix, guiy, guiw, guih, Validations QP

gui2x := guix+=guix
gui2y := guiy
gui2w := guiw
gui2h := guih4

Loop{
WinGetPos, guix, guiy, guiw, guih, Validations QP
gui2x := guix+=guiw
gui2y := guiy
gui2w := guiw
gui2h := guih4

WinMove, VQP PushBot,,%gui2x%,%gui2y%
}
return		
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Simple and nasty progress bar code. More like a timer. I can't remember if it's the Loop number or the Sleep that effects the progress bar speed. More for show.
{
Gui,1:Add,Progress,    x10  y10 w400 h20  vPRBAR 
Gui,1:Add,Text, cBlack x10  y10 w400 h20 +0x200 +Center +BackgroundTrans vText22,        ;here empty 
Gui,1:Show, w400 h50 , INITIALIZING
loop, 100
{
 GuiControl,, PRBAR, +1
 GuiControl,1:,Text22,%A_Index%    ;to fill progressbar later
 sleep, 50
	
Gui, Timer: 
}
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------

}

{    ; ||FUNCTION CODES. GREAT FOR FUNCTION LIBRARIES OR SOME GOOD OLE' FASHIONED AND NASTY HARD CODING||
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	; Code that returns the number of unique values in a given column. Basically it removes duplicates.
{
		oWorkbook:= ComobjActive("Excel.Application")
	oWorkbook.Application.DisplayAlerts := False
	
	oWorkbook.Activesheet.Range("GG05").Formula:= "=Counta(G:G)"      
	maxRange:= Round(oWorkbook.Activesheet.Range("GG05").Value,0)
		formula = `=SUMPRODUCT(1/COUNTIF($G$1:$G$%maxRange%`,$G$1:$G$%maxRange%))
		oWorkbook.Activesheet.Range("GG26").Formula:= formula
		oWorkbook.Application.Calculate()
		uniqueCount:= Round(oWorkbook.Activesheet.Range("GG26").Value,0)
			oWorkbook.Activesheet.Range("GG05").Value:= ""
			oWorkbook.Activesheet.Range("GG26").Value:= ""
	msgbox % uniqueCount . " Unique values found."
	
return
}	
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Codes for hiding columns, expanding columns, and formatting an excel sheet to a data table. 
{

HideList:= ["A","B","C","D","E","H","I","J","L","M","O","P","T","W","X","Y"]		
ExpandList:= ["F","G","K","N","Q","U"]													

For i in HideList 
	oWorkbook.ActiveSheet.Columns(hideList[A_INDEX]).EntireColumn.Hidden:= True		; hide columns in array

For i in ExpandList
	oWorkbook.ActiveSheet.Columns(ExpandList[A_INDEX]).EntireColumn.Hidden := False	; expand columns in array
try
{
  oWorkbook.ActiveSheet.ListObjects.Add(1, oWorkbook.Activesheet.Range("A1").CurrentRegion, , 1)	; Generate table + Rename
    ListObj.Name := "Table"
}
	
Loop, 20
	Try
If (oWorkbook.ActiveSheet.ListObjects[A_INDEX].Active) = (-1)	; Find the table generated
	Table:= oWorkbook.ActiveSheet.ListObjects[A_INDEX].Name
Sleep, 300
;~ Try
;~ oWorkbook.ActiveSheet.Range("V1").AutoFilter(22, "0")		; Add a sort
;~ Catch
;~ oWorkbook.ActiveSheet.Range("V1").AutoFilter(22, "0")		; On error, attempt one more time


return
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Call to an Excel Sheet

gui, submit, nohide
	FullPath = C:\Users\%user%\Desktop\MDR.xlsx

IfWinNotExist, MSQT - Excel
{
	oExcel := ComObjCreate("Excel.Application")
	oWorkbook := oExcel.Workbooks.Open(fullPath)
	oExcel.Visible := true
	WinWait, MDR - Excel
	oWorkbook :=
	oExcel :=
}
return
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Exports to an Excel Sheet from a vLabel
{
oWorkBook := ComObjGet(FullPath)
oWorkbook.Application.Windows(oWorkbook.Name).Visible := 1 
oWorkbook.Application.DisplayAlerts := 0

oCellRegion := oWorkbook.sheets("Sheet1")

oCellRegion.Range("D41").value := vLabel

Return
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Hides the Mouse Cursor
OnExit, ShowCursor  ; Ensure the cursor is made visible when the script exits.
return

ShowCursor:
SystemCursor("On")
ExitApp

^y::SystemCursor("Toggle")  ; Win+C hotkey to toggle the cursor on and off.

SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ = h                                          ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
            b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; use blank cursors
    else
        $ = h  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}
return
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Opens a notepad and returns it's coordinates.
{
^i::
Run Notepad
WinWait Untitled - Notepad  ; This also sets the "last found window" for use with WinExist() below.
VarSetCapacity(Rect, 16)  ; A RECT is a struct consisting of four 32-bit integers (i.e. 4*4=16).
DllCall("GetWindowRect", Ptr, WinExist(), Ptr, &Rect)  ; WinExist() returns an HWND.
MsgBox % "Left " . NumGet(Rect, 0, "Int") . " Top " . NumGet(Rect, 4, "Int")
    . " Right " . NumGet(Rect, 8, "Int") . " Bottom " . NumGet(Rect, 12, "Int") 
Return
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------

}

{    ; ||MESSAGE BOX MAGIC||
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	; Gets the title of the currently active window and returns it as a MsgBox	
WinGetTitle, Title, A 
	MsgBox, %Title%
Return
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
}



































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
;***************************************************************
;*CM VQP|v.1.1.0.|Author - Brad O'Neal| Last Updated: 04/23/18 *
;***************************************************************

; OPENING GUFF
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
{
Menu, Tray, Icon, keyline.png
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
global oWorkbook ; global var to utilize in external functions
global Time
global Scan
global w
global ie
global SGLength := []

w = 0
Time = 0

try
ExcelInit() ;initializes the excel COM connection under variable handle "oWorkbook"
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------

; GUI ACTUAL
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
{
gui, +alwaysontop
Gui, Add, Picture, x150 y08 w90 h90 ,keyline.png
Gui, Add, Button, gIdent x112 y30 w100 h20, Identify Sheet
Gui, Add, Button, gRed x12 y50 w100 h30 , Red
Gui, Add, Button, gGreen x112 y50 w100 h30 , Green
Gui, Add, Button, gFormat x12 y30 w100 h20 , Format CM Build
Gui, Show, w227 h85, CM VQP
gui, color, windowcolor884488, controlcolorFFFF99
return
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------

; EXIT PLAN
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
GuiClose:
{
MsgBox, 262196, , Close Quickpad?
	IfMsgBox Yes
	{
		exitapp
		return
	}
	Else
		Gui, Show
Return
}
;------------------------------------------------------------------------------------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
; |FUNCTIONS|
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	
;------------------------------------------------------------------------------------------------------------------------------------------------------------------	


ExcelInit() {
	oWorkbook:= ComobjActive("Excel.Application")
	oWorkbook.Application.DisplayAlerts := False
}

Button(color) {
	oWorkbook.Application.DisplayAlerts := FALSE
	;~ Try
	;~ {
		switch = 1
		
		Loop, 5
			Try
		If (oWorkbook.ActiveSheet.ListObjects[A_INDEX].Active) = (-1)	; Attempt to find the table
			Table:= oWorkbook.ActiveSheet.ListObjects[A_INDEX].Name		; Declare table
			
		Check:= oWorkbook.Range(table).Rows(1).Row						; Find the row
			
		i :=  oWorkbook.Selection.Rows.Count						; Loop the selected range
		Loop, %i%
		{
			rw:= oWorkbook.Selection.Cells(A_INDEX).Row	; Find the current row
			
			rw:= (RW - Check) + 1
			
			if (RW > 0)
			{
				if !(oWorkbook.Selection.Cells(A_Index).EntireRow.hidden) then
				{
					try
					oWorkbook.Range(table).Rows(rw).Font.ColorIndex:= color
				}
			}	
			rw+=1
			
			if (switch = "1")
			{
				Guicontrol, Timer:, Time, +1
				t+=1
				if (t = "100")
					switch = 0
			} 
			
			if (switch = "0") 
			{
				t-=1
				Guicontrol, Timer:, Time, -1
				if (t = "0")
					switch = 1
			}
			GuiControl, Timer:, Scan, Records Colored: %A_index%
		}
	;~ }
	oWorkbook.Application.DisplayAlerts := TRUE	; re-enable alerts
return
}

Red:
{
	Gui, Timer: Color, white
	Gui, Timer: Add, Text, x42 y29 w170 h20 , Please wait`,  comparing...
	Gui, Timer: Add, Progress, x42 y59 w300 h20 cRed vTime range0-50, 
	Gui, Timer: Add, Text, x212 y29 w140 h20 vScan, 

	Gui, Timer: Show, w391 h97, Comparing...

	color = 3
	Button(color)
	Gui, Timer: destroy
	return
}

Green:
{
	Gui, Timer: Color, white
	Gui, Timer: Add, Text, x42 y29 w170 h20 , Please wait`,  comparing...
	Gui, Timer: Add, Progress, x42 y59 w300 h20 cGreen vTime range0-%TopRange%, 
	Gui, Timer: Add, Text, x212 y29 w140 h20 vScan, 

	Gui, Timer: Show, w391 h97, Comparing...
	color = 50
	Button(color)
	Gui, Timer: destroy
	return
}

Format: 
{

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



return
}

Ident:
{
Try
	{
	oWorkbook := ComObjActive("Excel.Application")
		For workbook in oWorkbook.Workbooks
		MsgBox, % Workbook.Name
	}	
	catch
		MsgBox Please Select an Excel Sheet
return	
}
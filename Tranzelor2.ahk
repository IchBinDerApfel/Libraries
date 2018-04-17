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

; Opening Guff
{
; Authors: Voiles/O'Neal
; Last updated: 4/17/18 1500EST by O'Neal
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
User = % Username
}

; Initial Directory Creation
{
ifexist, C:\Autohotkey\Translator\pPath.txt
	fileread, pythonPath, C:\Autohotkey\Translator\pPath.txt
	;~ MsgBox, Sup
else
{
	MsgBox, 64,, Please wait while this app is a pain in the ass, 10
	fileCreateDir, C:\Autohotkey
	fileCreateDir, C:\Autohotkey\Translator\
	Gui,1:Add,Text, cBlack x10  y10 +0x200 vTextHeader,  Searching for Source Files:
	Gui,1:Add,Text, cBlack y+10 +0x200 vText22, xxxxxxxxxxxxxxxxxXXXXXXXXXXxxxxxxxYYYYYYYYYYyyyyyyYYYYYYYYYYYYYYYYYYY`r`nxxxxxxxxxxxxxxxxxXXXXXXXXXXxxxxxxxYYYYYYYYYYyyyyyyYYYYYYYYYYYYYYYYYYY       ; Gibberish Text to auto-size the gui out so a GuiControl for gui width isn't needed later
	Gui,1:Show,  , Doin Stuff
		GuiControl, 1:, Text22, %A_SPACE%			; Once the GUI is shown, Immediately clear out the text before it's even visible

	Loop Files, C:\users\%username%\*py,R 
	{
		GuiControl, 1:, Text22,%A_LoopFileDir%
			Sleep, 50
		ifinstring, A_LoopFileFullpath, translate.py
			pythonPath:= A_LoopFileFUllpath
	}
	FileDelete, C:\Autohotkey\Translator\pPath.txt
	fileAppend, %pythonPath%, C:\Autohotkey\Translator\pPath.txt
}
}

; Language Output selection
{
choice:= ["English","German","Spanish","Afrikaans","Arabic","Armenian","Belarusian","Bulgarian","Catalan","Chinese","Chinese","Croatian","Czech","Danish","Dutch","Esperanto","Estonian","Filipino","Finnish","French","Greek","Hebrew","Hindi","Hungarian","Icelandic","Indonesian","Irish","Italian","Japanese","Korean","Latvian","Lithuanian","Norwegian","Persian","Polish","Portuguese","Romanian","Russian","Serbian","Slovak","Slovenian","Swahili","Swedish","Thai","Turkish","Ukrainian","Vietnamese"]	; List of Output Languages
result:= ["en","de","es","af","ar","hy","be","bg","ca","zh-CN","zh-TW","hr","cs","da","nl","eo","et","tl","fi","fr","el","iw","hi","hu","is","id","ga","it","ja","ko","lv","lt","no","fa","pl","pt","ro","ru","sr","sk","sl","sw","sv","th","tr","uk","vi"]						; Python translation codes for Language Output
for index in choice
	dropDownVar:= dropDownVar . "|" . choice[A_INDEX]	; loop through choices to assign to the dropdown variable
}

; GUI Actual
{
Gui,1: destroy
Gui,2: new	
Gui,2: Add, Edit, w450 vTextToTranslate hwndEdit1,
Gui,2: Add, Button, x350 y30 w20 h20 gMinimize, [-]	
Gui,2: Add, Button, x370 y30 w20 h20 gExit, [X]		
Gui,2: Add, DropDownList, x100 y30 w100 vLanguageChoice, %dropDownVar%
Gui,2: Add, Text, w450 vTranslated,
Gui,2: Add, Button, x222 y30 w100 h20 gTranslate, Translate!
Gui,2: Show, w480 h100, Tranzelor
Gui,2: color, silver
gui,2: -SysMenu
return
}

; Code that links to the Python Translation Code
{
Translate:
Gui 2: Submit, noHide

for index in choice
	if (languageChoice = (choice[A_INDEX]))	; Since the choice and result line up, look for the choice
		lng:= result[A_INDEX]				; And assign lng to be the result for that choice
	
var = %textToTranslate%|%lng%
RUN, %pythonPath% %var%
Loop
	ifwinexist, Python Action Complete
	{
		ControlGetText, var, Static1, Python Action Complete
		Winclose, Python Action Complete
		break
	}
GuiControl, text, translated, %var% 
Return
}

; Exit and Minimize Coding
{
Exit:
MsgBox, 36, Tranzelor, Leave Tranzelor?
	IfMsgBox, Yes
		{
		ExitApp
		}
	else
		{	
		Gui,2: Show
		}
Return		

Minimize:
Gui,2: Minimize
Return
}





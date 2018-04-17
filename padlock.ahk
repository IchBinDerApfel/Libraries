code:= ["A","M","O","G","U","R","Y"]
Gui, Add, Button, w200 gBtn1,1
Gui, Add, Button, w200 gBtn2,5
Gui, Add, Button, w200 gBtn7,9
Gui, Add, Button, w200 GgBtn3,7
Gui, Add, Button, w200 gBtn4,3`
Gui, Add, Button, w200 gBtnH,6
Gui, Add, Button, w200 gBtn5,8
Gui, Add, Button, w200 gBtn6,2
Gui, Add, Button, w200 gBtnF,0
Gui, Add, Text, vText, XXXXXXXXXXXXXXXXXXXXXXXXXXXXX`r`n
Gui, Show,, Padlock
GuiControl, , text, %A_SPACE%
return
; 8,2,5,7,5,3,1,9 

GuiClose:
ExitApp

btnF:
	guiButtonVar := ""
	GuiControl, , text, %guiButtonVar%
return

btnh:
	guiButtonVar := ""
	GuiControl, , text, %guiButtonVar%
return
btn1:
	if (guiButtonVar = (code[5] . code[6] . code[2] . code[3] . code[2] . code[4]))
		guiButtonVar := StrReplace(guiButtonVar . code[1],A_SPACE)
	else
		guiButtonVar:= ""
GuiControl, , text, %guiButtonVar%
	return
btn2:
pass = 0
	if (guiButtonVar = (code[5] . code[6]))
	{
		guiButtonVar := StrReplace(guiButtonVar . code[2],A_SPACE)
		pass = 1
	}
	if (guiButtonVar = (code[5] . code[6] . code[2] . code[3]))
	{
		pass = 1
		guiButtonVar := StrReplace(guiButtonVar . code[2],A_SPACE)
	}
	if pass = 0
		guiButtonVar:= ""
GuiControl, , text, %guiButtonVar%
	;~ Stuff
return
gbtn3:
	if (guiButtonVar = (code[5] . code[6] . code[2]))
		guiButtonVar := StrReplace(guiButtonVar . code[3],A_SPACE)
	else
		guiButtonVar:= ""
GuiControl, , text, %guiButtonVar%
return
btn5:
	if not guiButtonVar
		guiButtonVar := StrReplace(guiButtonVar . code[5],A_SPACE)
		else
		guiButtonVar:= ""
GuiControl, , text, %guiButtonVar%
return
btn6:

	if (guiButtonVar = (code[5]))
		guiButtonVar := StrReplace(code[5] . code[6],A_SPACE)
	else
		guiButtonVar:= ""

GuiControl, , text, %guiButtonVar%
return
btn4:
	if (guiButtonVar = (code[5] . code[6] . code[2] . code[3] . code[2]))
		guiButtonVar := StrReplace(guiButtonVar . code[4],A_SPACE)
	else
		guiButtonVar:= ""
GuiControl, , text, %guiButtonVar%
return
btn7:
		if (guiButtonVar = (code[5] . code[6] . code[2] . code[3] . code[2] . code[4] . code[1]))
					guiButtonVar := StrReplace(guiButtonVar . code[7],A_SPACE)
					Else
						guiButtonVar:= ""
					GuiControl, , text, %guiButtonVar%
					if guiButtonVar
						msgbox Congratulations.
					return
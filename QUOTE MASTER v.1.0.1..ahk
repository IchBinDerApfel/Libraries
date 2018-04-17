User = % A_UserName
SetMouseDelay,-1
AutoTrim, On
#SingleInstance force
Sendmode, input
Setkeydelay, 0
#WinActivateForce
DetectHiddenWindows, On
DetectHiddenText, On
#Persistent
Coordmode, Relative
SetFormat float, 0.2
;~ SetTitleMatchMode, 2
#NoEnv 
#Warn  
SendMode Input 
SetWorkingDir %A_ScriptDir% 
#SingleInstance FORCE


;<<< ░░ ░░░░▄░░░░░░░░░ ▄ 
;░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌ 
;░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐ 
;░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ 
;░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ 
;░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ 
;░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌ 
;░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ 
;░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ 
;░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌     WOW
;▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐     SUCH CODE
;▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌ 
;▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ 
;░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌ 
;░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐ 
;░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌ 
;░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ 
;░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄—







;~ global vTotalRepairCost
;~ global vvMaterialCost
;~ global vNamePlateData
;~ global vNotes
;~ global vLaborCost
;~ global vAttention
;~ global vCustomer
;~ global vQuoteNum
;~ global vJobNum

MsgBox, 4160, INITIALIZING, Hello!`nWelcome to Quote Master!, 5

list1 := ["TRANSPORT TO TEKWELL FACILITY","DISASSEMBLE AND INSPECT","CHECK ALL FITS AND RECORD DATA","WASH AND CLEAN ALL PARTS","SANDBLAST COMPONENTS","CHECK TIR OF ROTOR","WASH AND BAKE STATOR","DIP AND BAKE STATOR","CUT AND STRIP STATOR","REWIND STATOR AND TEST","REWIND ARMATURE AND TEST","REWIND FIELD COILS","REWIND INTERPOLES","RE-LEAD STATOR","REPOT CORDS","DYNAMICALLY BALANCE ROTOR","DYNAMICALLY BALANCE ARMATURE","DYNAMICALLY BALANCE FAN","DYNAMICALLY BALANCE IMPELLER","MACHINE SHAFT FIT","MACHINE SEAL FIT","MACHINE NEW SHAFT SLEEVE","MACHINE PE BEARING JOURNAL","MACHINE OPE BEARING JOURNAL","MACHINE PE BEARING HOUSING","MACHINE OPE BEARING HOUSING","MACHINE BEARING CARRIER","TURN/UNDERCUT COMMUTATOR","INSTALL NEW OPE BEARING","INSTALL NEW PE BEARING","ASSEMBLE AND TEST","LOAD TEST MOTOR","PRESSURE TEST FOR LEAKS","CLEAN AND PAINT","FINAL QUALITY CHECK PROCEDURE","PREPARE UNIT FOR SHIPPING","RETURN UNIT TO CUSTOMER FACILITY","BEARING ISOLATOR-FURNISH AND INSTALL","GROUNDING RING-FURNISH AND INSTALL","BRUSHES-FURNISH AND INSTALL","SPACE HEATERS-FURNISH AND INSTALL","THERMAL PROTECTORS-FURNISH AND INSTALL","MECHANICAL SEALS-FURNISH AND INSTALL","GASKETS/O RINGS-FURNISH AND INSTALL","POWER CORDS-FURNISH AND INSTALL","CONTROL CORDS-FURNISH AND INSTALL","LIP SEALS-FURNISH AND INSTALL","REPLACE DEFECTIVE HOIST PARTS"]
list2 := []
Gui, Add, ListBox, x32 y40 w310 h480 vlb1 gaddItem, % arrayToString(list1,1)
Gui, Add, ListBox, x382 y40 w310 h472 vlb2, % arrayToString(list2) 
Gui, Add, GroupBox, x32 y520 w660 h320 , Quote Info
Gui, Add, Text, x1335 y890 w100 h20, v.1.0.1
Gui, Add, Button, x700 y100 w100 h30, HELP
Gui, Add, Button, x700 y200 w100 h30 gServiceQuote, SERVICE QUOTE
Gui, Add, Button, x700 y370 w100 h30 gbuttonDelete, DELETE ITEM
Gui, Add, Button, x700 y410 w100 h30 gbuttonClear, CLEAR
Gui, Add, Button, x700 y450 w100 h30, EXPORT
Gui, Add, Text, x62 y540 w180 h30 , Job Number
Gui, Add, Text, x62 y580 w180 h30 , Quote Number
Gui, Add, Text, x62 y620 w180 h30 , Customer
Gui, Add, Text, x62 y660 w180 h30 , Attention
Gui, Add, Text, x62 y700 w180 h30 , Labor Cost
Gui, Add, Text, x62 y740 w180 h30 , Material Cost
Gui, Add, Text, x62 y780 w180 h30 , Total Repair Cost
Gui, Add, Edit, x152 y780 w220 h30 vTotalRepairCost, 
Gui, Add, Edit, x152 y740 w220 h30 vMaterialCost, 
Gui, Add, Text, x382 y540 w120 h30 , Nameplate Data
Gui, Add, Edit, x462 y540 w540 h100 vNamePlateData, 
Gui, Add, Text, x382 y660 w120 h30 , Notes
Gui, Add, Edit, x462 y660 w540 h100 vNotes, 
Gui, Add, Edit, x152 y700 w220 h30 vLaborCost, 
Gui, Add, Edit, x152 y660 w220 h30 vAttention, 
Gui, Add, Edit, x152 y620 w220 h30 vCustomer, 
Gui, Add, Edit, x152 y580 w220 h30 vQuoteNum, 
Gui, Add, Edit, x152 y540 w220 h30 vJobNum, 
Gui, Show, w1376 h910, QUOTE MASTER
addItem:
GuiControl, enable, lb2
gui,submit,nohide
list2.insert(RegExReplace(lb1,"^\d+\.\s",""))
guicontrol,,lb2,|
guicontrol,,lb2, % arrayToString(list2)
return 

arrayToString(a,numbered=0) {           ; If I remember correctly, this is where the numbers in list1 come from and disappear in list2. This works.
	s := ""
	loop % a.length() {
		s .= (a_index > 1 ? "|" : "") (numbered ? a_index ". " : "") a[a_index]
	}
return S

GuiClose:
MsgBox, 4160, Exiting, Thank you for using Quote Master.`nHave a great day!, 5
ExitApp
}

buttonHELP:          ; This works.
{
MsgBox, 4160, Processing, Please submit a detailed description of the problem you are having, or the question that you have.`nIf applicable, please include a screenshot of the error message received.`nThank you.
Run, Outlook.exe /c ipm.note /m boneal@tekwellservices.com&subject=Quote`%20Master`%20Help&body=Tell`%20me`%20how`%20I`%20can`%20I`%20help
return 
}

buttonDELETE:          ; IT WORKS! UNTIL YOU HIT THE CLEAR BUTTON! THEN ITS FUCKERED AGAIN! NOOOOOOOO!
{
gui, submit, nohide

if(lb2){
for i, item in list2 {  
	if (item == lb2){
		arraytostring(list2.remove(A_index))
	}
}
GuiControl,, lb2, % arraytostring(list2)
}

;MsgBox, 4160, Notice, I hate this damned thing.
return
}

buttonCLEAR:          ; Works
{
gui, submit, nohide

list2 := []
GuiControl,, lb2,|
;GuiControl,, lb2, % arraytostring(list2)
;GuiControl, disable, lb2
ControlSetText, edit1, 
ControlSetText, edit2, 
ControlSetText, edit3, 
ControlSetText, edit4, 
ControlSetText, edit5, 
ControlSetText, edit6, 
ControlSetText, edit7, 
ControlSetText, edit8, 
ControlSetText, edit9, 
gui, submit, nohide

return
}

If(A_TimeIdlePhysical <2000)
	MsgBox, 292, Hey., Are you still there?

buttonEXPORT:          ; This works to a point. It will open the template sheet ONCE, but will not export information anymore. 
{
	gui, submit, nohide
FullPath = C:\Users\%user%\Desktop\MSQT.xlsx

IfWinNotExist, MSQT - Excel
{
	oExcel := ComObjCreate("Excel.Application")
	oWorkbook := oExcel.Workbooks.Open(fullPath)
	oExcel.Visible := true
	WinWait, MSQT - Excel
	oWorkbook :=
	oExcel :=
}
oWorkBook := ComObjGet(FullPath)
oWorkbook.Application.Windows(oWorkbook.Name).Visible := 1 
oWorkbook.Application.DisplayAlerts := 0

oCellRegion := oWorkbook.sheets("Sheet1")

;~ oCellRegion.Range("").value := TotalRepairCost
oCellRegion.Range("D41").value := MaterialCost
oCellRegion.Range("C10").value := NamePlateData
;~ oCellRegion.Range("").value := Notes
oCellRegion.Range("D40").value := LaborCost
oCellRegion.Range("G3").value := Attention
oCellRegion.Range("E4").value := Customer
oCellRegion.Range("E3").value := QuoteNum
oCellRegion.Range("B3").value := JobNum

;MsgBox, 4160, Notice, WTF!!??`nThis was working perfectly the other day!?.
return
}

buttonSERVICEQUOTE:      ; Need to build the GUI for this. 
{
MsgBox, 4160, CODE UNDER CONSTRUCTION, At some point this button will open the Service Department Quote Interface. That point being when I get around to writing it.,
return
}

Esc::          ; "Yes" works. "No", not so much.
{
MsgBox, 4, ALERT, Do you really wish to perform an Emergent-Close?
IfMsgBox Yes
	Run, Outlook.exe /c ipm.note /m boneal@tekwellservices.com&subject=QUOTE`%20MASTER`%20EMERGENT`%20CLOSE`%20DETECTED&body=Please`%20follow`%20up`%20with`%20sender`%20ASAP. 
	ExitApp
IfMsgBox, No
		MsgBox, 4160, , PROCESSING..., 2
return
}

; Hidden Hot Keys
{

^Esc::          ; Gui reset.
{
Reload, Gui
return
}

F1::          ; Oh man, I really hope someone finds this one.
{
MsgBox, 16432, Error A.1116584F.9999.EE32XXXVH0H, USER INPUT ERROR. CRITICAL SYSTEMS FAILURE.`n`nPLEASE PROCEED TO THE NEAREST EXIT AS THIS PROGRAM HAS INSTRUCTED YOU TO FOR YOUR OWN SAFETY.`n`nCRITICAL SYSTEMS FAILURE., 5
return
}

^!Q::          ; I'm kind of excited to see if anyone ever finds this one.
{
Run, https://www.youtube.com/watch?v=fJ9rUzIMcZQ
return
}
}

ServiceQuote:          ; Hopefully shit doesn't crash or freeze up when I try to write the GUI for this for a THIRD TIME.
{
MsgBox, 4160,  , THERE IS NOTHING HERE YET.`nGO AWAY!,

return	
}

;~ If(A_TimeIdlePhysical <2000)
	;~ MsgBox, 292, Hey., Are you still there?


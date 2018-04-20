;****************************
;*<<< ░░ ░░░▄░░░   ░░░░░░ ▄ *
;*░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌ *
;*░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐ *
;*░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ *
;*░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ *
;*░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ *
;*░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌ *
;*░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ *
;*░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ *
;*░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ *
;*▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐ *****************
;*▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌ Wow. Such Code.*
;*▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ *****************
;*░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌ *
;*░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐ *
;*░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌ *
;*░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ * 
;*░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄— *
;***************************
; ******************
; * |  |  __   |-\ *
; * |  | /  \  |_| *
; * | /  | \|  |   *      *********************************
; * \/   \__\_ |   *      || Authors: Voiles/O'Neal/White||
; *********************************************************	
; Version: 3.1.8	   || Updated: 4/5/18 by Brad O'Neal ||
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
; OPENING SCHEIßE
{
;~ Menu, Tray, Icon, keyline.png
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
gui, 1: +alwaysontop
gui, 2: +AlwaysOnTop

EM_SETCUEBANNER(hWnd, Cue) {
    return DllCall("user32.dll\SendMessage", "Ptr", hWnd, "UInt", 0x1501, "Ptr", 1, "Ptr", &Cue, "Ptr")
} 

;~ #Include ValidationsFunctions.ahk
;~ #Include IELib.ahk


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

;******************************************************************************************************************************************************************

; GUI(S) ACTUAL
{

GUI1:
{
Gui, GUI1: -SysMenu
Gui, GUI1: +AlwaysOnTop
Gui, GUI1: Add, Picture, x150 y08 w90 h90 ,keyline.png
Gui, GUI1: Add, Button, gBIT x12 y10 w90 h20 , BIT
Gui, GUI1: Add, Button, gKPSF x12 y30 w90 h20 , KPSC
Gui, GUI1: Add, Button, gWork x12 y50 w90 h20 , Work Sharepoint
Gui, GUI1: Add, Button, gCalc x12 y70 w90 h20 , Build Line Calc.
Gui, GUI1: Add, Button, gFormatSheet x12 y100 w160 h20 , Format EPIC Build
Gui, GUI1: Add, Button, gGreen x92 y120 w80 h20 , Green
Gui, GUI1: Add, Button, gRed x12 y120 w80 h20 , Red
Gui, GUI1: Add, Button, gMin x210 y10 w15 h15, -
Gui, GUI1: Add, Button, gClose1 x225 y10 w15 h15, X
Gui, GUI1: Font, S8 CWhite, Verdana
Gui, GUI1: Add, Button, gGUI2 x185 y120 w60 h20, Push Bot
Gui, GUI1: Show, w251 h150, Validations QP V.3.1.1.
Gui, GUI1: color, windowcolor884488, controlcolorFFFF99



return
}

GUI2:
{
Gui, GUI2: -SysMenu
Gui, GUI2: +AlwaysOnTop
Gui, New ; Prevents GUI Fusion
Gui, GUI2: Font, S8 CWhite, Verdana
Gui, GUI2: Font, S8 CDefault, Verdana
Gui, GUI2: Add, Edit, x12 y30 w100 h20 vGroupNo hwndEdit1,
			EM_SETCUEBANNER(Edit1, "Group Number")
Gui, GUI2: Add, Edit, x12 y90 w100 h20 vPlanYear hwndEdit1, 
			EM_SETCUEBANNER(Edit1, "Effective Year") 
Gui, GUI2: Add, Edit, x142 y30 w40 h20 vSG1 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-")
Gui, GUI2: Add, Edit, x142 y60 w40 h20 vSG2 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-") 
Gui, GUI2: Add, Edit, x142 y90 w40 h20 vSG3 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-") 
Gui, GUI2: Add, Edit, x192 y30 w40 h20 vSG4 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-") 
Gui, GUI2: Add, Edit, x192 y60 w40 h20 vSG5 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-") 
Gui, GUI2: Add, Edit, x192 y90 w40 h20 vSG6 hwndEdit1,
			EM_SETCUEBANNER(Edit1, "-") 
Gui, GUI2: Add, Button, gClose2 x250 y10 w15 h15, X
Gui, GUI2: Font, S8 CWhite, Verdana
Gui, GUI2: Add, Text, x12 y10 w100 h20 , Group Number
Gui, GUI2: Add, Text, x12 y60 w100 h30 , Plan Effective Year
Gui, GUI2: Add, GroupBox, x132 y10 w110 h110 , Sub Groups
Gui, GUI2: Font, S8 CDefault, Verdana
Gui, GUI2: Add, Button, gCloseGroup x12 y120 w100 h30 , Push to Close
Gui, GUI2: color, windowcolor, Silver
Gui, GUI2: Show, w270 h170, VQP PushBot

WinGetPos, guix, guiy, guiw, guih, Validations QP

gui2x := guix+=guix
gui2y := guiy
gui2w := guiw
gui2h := guih4

Loop{
	IfWinNotExist, VQP PushBot
	break
WinGetPos, guix, guiy, guiw, guih, Validations QP
gui2x := guix+=guiw
gui2y := guiy
gui2w := guiw
gui2h := guih4

WinMove, VQP PushBot,,%gui2x%,%gui2y%

}
return

}	


}

;******************************************************************************************************************************************************************

; BUTTONS
{
CloseGroup:
{
	Gui, Submit
	SubGroupCount(SG1, SG2, SG3, SG4, SG5, SG6)
	
Site:="https://kp.my.salesforce.com/home/home.jsp"
IfWinNotExist, Salesforce - Unlimited Edition
{
run iexplore.exe %Site%
	WinWait, Salesforce
}

	ie := IEGet("Salesforce - Unlimited Edition")

	for subgroup in SGLength
	{
		SearchInput := GroupNo "," A_space SGLength[A_index] "," A_space PlanYear
		
		ElementInteraction("phSearchInput", "INPUT", ie, "Set", SearchInput, "ID")
		WinGetTitle, PrevName, ahk_class IEFrame
		StringRight, ieHandle, Prevname, 20
		StringReplace, PrevName, PrevName, %IeHandle%,, all	
		
				
		ElementInteraction("phSearchButton", "INPUT", ie, "Click", SearchInput, "ID")
		
		ie := postClickTitleComparison(prevName, ieHandle)
		IeLoad(ie)
		
		WinGetTitle, PrevName, ahk_class IEFrame
		StringReplace, PrevName, PrevName, %IeHandle%,, all
		loop
		{
			try
			{
				thething := ie.Document.getElementsByTagName("A")[A_INDEX - 1`].InnerText
				if (thething = "edit")
				{
					ie.Document.getElementsByTagName("A")[A_INDEX].focus
					ie.Document.getElementsByTagName("A")[A_INDEX].click()
					break
				}
			}
			catch
			{
				msgbox yall got an error
				return
			}
		}
		
		Sleep, 5000
		
		ie := postClickTitleComparison(prevName, ieHandle)
		IeLoad(ie)
		
		
		WinGetTitle, PrevName, ahk_class IEFrame
		StringReplace, PrevName, PrevName, %IeHandle%,, all
		
		ElementInteraction("manage_action_items", "INPUT", ie, "Click", "null", "Name")
		ieload(ie)
		
		
		ie := postClickTitleComparison(prevName, ieHandle)
		IeLoad(ie)
		
		WinGetTitle, PrevName, ahk_class IEFrame
		StringReplace, PrevName, PrevName, %IeHandle%,, all
		
		ElementInteraction("thisPage:thisForm:j_id2:j_id11:0:j_id13", "INPUT", ie, "Click", "-1", "Name")
		
		Sleep, 5000
		
		MsgBox, Intermission
		
		;~ MsgBox, % ElementInteraction("thisPage:thisForm:j_id2:j_id11:1:j_id13", "INPUT", ie, "Click", "null", "Name") ; for validations
		
		IeLoad(ie)
		ie := postClickTitleComparison(prevName, ieHandle)
		IeLoad(ie)
		
		WinGetTitle, PrevName, ahk_class IEFrame
		StringReplace, PrevName, PrevName, %IeHandle%,, all
		
		
		;~ ElementInteraction("thisPage:thisForm:j_id2:j_id3:j_id10", "INPUT", ie, "Click", "null", "Name")
		
		IeLoad(ie)
		ie := postClickTitleComparison(prevName, ieHandle)
		IeLoad(ie)
		
		WinGetTitle, PrevName, ahk_class IEFrame
		StringReplace, PrevName, PrevName, %IeHandle%,, all
		
		
	}
}

BIT:    ; OPENS BIT
{
IfWinNotExist, Bizagi BPM
	Run, iexplore.exe http://kpbenefitsconnect.com/kp/ 
else
	WinActivate, Bizagi BPM
return
}	
	
Calc:    ; RETURNS THE NUMBER OF UNIQUE VALUES IN COLUMN G ON AN EPIC PLAN BUILD
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
	
FormatSheet:    ; FORMATS THE EPIC PLAN BUILD FOR EASY VALIDATION
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
	
	
	
KPSF:    ; OPENS KP SALES CONNECT PAGE
{
;~ IfWinNotExist, [windowtitle]
	Run, https://kp.my.salesforce.com/
;~ else
	;~ WinActivate, [windowtitle]
return	
}

Work:    ; OPENS THE BENEFITS SHAREPOINT PAGE
{
IfWinNotExist, Benefits - All Documents
	run, https://ts.accenture.com/sites/Kaiser_Permanente_Client_Accenture_TeamSite2/Aria/Shared`%20Documents/Benefits/ 
else
	WinActivate, Benefits - All Documents 
Return
}

; GUI2 CAN BE FOUND UNDER GUI ACTUAL

{
Min:
Gui, Minimize
Return
}

}

;******************************************************************************************************************************************************************

; SPICYKEYS
{
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

^!x::
{
MsgBox, 262176, You Heckin Found Me!, `;<<< ░░ ░░░░▄░░░░░░░░░ ▄ `n`;░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌ `n`;░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐ `n`;░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ `n`;░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ `n`;░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ `n`;░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌ `n`;░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ `n`;░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ `n`;░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ `n`;▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐ `n`;▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌ `n`;▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ `n`;░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌ `n`;░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐ `n`;░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌ `n`;░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ `n`;░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄—
return
}
	
^Esc::
{
Gui, destroy
run, VQP.ahk
return	
}	
	
}

;******************************************************************************************************************************************************************

; EXIT STRATEGIES
{
Close1:

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
Close2:
{
	Gui, Destroy
	return
}	
}
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
; IE LIBRARY
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
{
IEGet(Name="") {       ;Retrieve pointer to existing IE window/tab. Pass the title of the IE page to this function to initialize it as an object. example, ie:=IEGet("Google")
; Credit to Jethrow AHK forums
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
        If Instr(wb.LocationName,Name ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
}

FindIE(ShowMessage, Title) { ;Pass "True/False" to the Showmessage arg and the title of your page to the Title Arg. This will attempt to make the page the IE object, if not able, the item not found tip will show.
 ie := IeGet(Title)
 if (IsObject(ie)=false) &&(ShowMessage=True){
 TrayTip,Item List not found, Can't find the Item List screen!
    return false
  }
 return ie
}

IeLoad(Browser, Url:="") {
  ;Function Details:
  ;Returns True or False. Will indicate if the process was successful
  ;Parameter 1: Send a pointer to an internet explorer browser
  ;See IEGet on how to get a pointer
  ;Function will wait for a page to load
  ;Credit to Jethrow AHK Forums
  
  If !Browser
   return false
  
  ;Wait up to 2 minutes
  if (URL!="")
  {
   Loop, 480
   {
    sleep 250
    if (Instr(Browser.LocationURL,Url))
     break   
   }
  }
  
  loop, 50
  {
   if (Browser.busy || Browser.ReadyState<>4)
    sleep 100
  }
  
  loop, 4
  {
   tagnames:=Browser.document.getelementsbytagname("*").Length
   loop, 10
   {
    Sleep 100
    if (tagnames = Browser.document.getelementsbytagname("*").Length)
     return true
   }
  }
  
  return false
 }
  
CompareNewTitle(NewTitle, ieHandle) {
	/*
	compares the old title pull from the PostClickTitleComparison() and compares to the current title. you need to pass it the NewTitle and the same ieHandle
	*/
 invalidTitleCount = 0
 ValidTitleCount = 0
 Switch = 0
Loop
	{
		WinGetTitle, CurrentTitleName, ahk_class IEFrame
		StringReplace, CurrentTitleName, CurrentTitleName, %ieHandle%,, all
		if (NewTitle = CurrentTitleName)
			ValidTitleCount +=1
		else
			InvalidTitleCount +=1
		if (ValidTitleCount = 500)
		{
			Switch = 1
			break
		}
		if (InvalidTitleCount = 500)
		{
			Switch = 0
			break
		}
		ToolTip, %NewTitle%...%CurrentTitleName%...CNT func VC: %ValidTitleCount%..INVC: %InvalidtitleCount%...switch: %switch%
	}
	if (switch = 1)
	{
		return CurrentTitleName
	} else {
		return FALSE
	}
}
 
PostClickTitleComparison(prevName, ieHandle) {
	/*
	you must pull the previous IeFrame title as an AHK_class and pass to this function under "PrevName" the ieHandle portion is dedicated to be omitted from the title since COM doesnt like " - Internet Explorer" in the Title.
	*/
	count = 0
	Loop,
	{
		WinGetTitle, Name, ahk_class IEFrame
		StringReplace, Name, Name, %ieHandle%,, all
		if !(prevName = Name) 
		{
			Loop
			{
				ToolTip, %prevname%....%Name%.....not equal
				ie := FindIE(False, CompareNewTitle(Name, ieHandle))
				;~ ie := IeGet(comparenewtitle(name, iehandle))
				if !(ie = False)
				{
					return ie
				}
				if (ie = False)
				{
					ie :=
					WinGetTitle, PrevName, ahk_class IEFrame
					StringReplace, PrevName, PrevName, %IeHandle%,, all
				}
			}
		}
		if (prevname = Name)
		{
			ToolTip, %prevname%....%Name%.....equal %count%
			COUNT += 1
			if (count > 500)
			{
				ie := FindIE(False, Name)
				if !(ie = False)
				{
					return ie
				}
				if (ie = False)
				{
					WinGetTitle, Name, ahk_class IEFrame
					StringReplace, Name, Name, %IeHandle%,, all
				}
			}
		}
	}
}

GetURL() {
	WinGetTitle, IeTitle, ahk_class IEFrame
	ControlGetText, Url, Edit1, %IeTitle%
	return Url
}

IE_DocumentComplete(ieEventParam, url, ieFinalParam) {
    global ie
    if (ie != ieEventParam)
        s .= "First parameter is a new wrapper object.`n"
    if (ie == ieFinalParam)
        s .= "Final parameter is the original wrapper object.`n"
    if ((disp1:=ComObjUnwrap(ieEventParam)) == (disp2:=ComObjUnwrap(ieFinalParam)))
        s .= "Both wrapper objects refer to the same IDispatch instance.`n"
    ObjRelease(disp1), ObjRelease(disp2)
    MsgBox % s . "Finished loading " ie.Document.title " @ " url
    ie.Quit()
    ExitApp
}

GetWebBrowser() {
    ; Get a raw pointer to the document object of the top-most IE window.
    static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
    SendMessage msg, 0, 0, Internet Explorer_Server1, ahk_class IEFrame
    if ErrorLevel = FAIL
        return  ; IE not found.
    lResult := ErrorLevel
    DllCall("oleacc\ObjectFromLresult", "ptr", lResult
        , "ptr", GUID(IID_IHTMLDocument2,"{332C4425-26CB-11D0-B483-00C04FD90119}")
        , "ptr", 0, "ptr*", pdoc)
    
    ; Query for the WebBrowserApp service. In this particular case,
    ; the SID and IID are the same, but it isn't always this way.
    static IID_IWebBrowserApp := "{0002DF05-0000-0000-C000-000000000046}"
    static SID_SWebBrowserApp := IID_IWebBrowserApp
    pweb := ComObjQuery(pdoc, SID_SWebBrowserApp, IID_IWebBrowserApp)
    
    ; Release the document object pointer.
    ObjRelease(pdoc)
    
    ; Return the WebBrowser object, wrapped for usability:
    static VT_DISPATCH := 9, F_OWNVALUE := 1
    return ComObject(VT_DISPATCH, pweb, F_OWNVALUE)
}

GUID(ByRef GUID, sGUID) { ; Converts a string to a binary GUID and returns its address.

	MsgBox, % guid
	MsgBox, % sguid
    VarSetCapacity(GUID, 16, 0)
    return DllCall("ole32\CLSIDFromString", "wstr", sGUID, "ptr", &GUID) >= 0 ? &GUID : ""
}
 
ElementInteraction(ElementID, ElementTag, Browser, Action, ValueToSet, Type){
	/*
	Arguments are utilized by DOM Elements in IE
	ElementID: this is the specific Identifier handle you're looking for. This can either be the "Name" or the "ID" of the element itself. Case Sensitive
	ElementTag: This is the actual tag that houses the Element. So, <div>; <input>; <p> ; <a> etc...
	Browser: This is the IE Object Handle. Typically made as "ie"
	Action: The desired action once the object has been found. Accepted inputs are "Click", "Set", and "Get"
	ValueToSet: This is only utilized in the "Set" Action. This must be not null to pass appropriately, but will not affect the "Get" and "Click" Portions
	Type: Specifies the type of input you are using. Currently, this function can only be utilized with "ID" or "Name"
	*/
  
   ;~ IfWinNotExist, Libraries
		;~ run, explorer.exe
   if (Type = "ID") 
    {
		try
		{
			AllItems:=ie.Document.getElementsByTagName("*")
			DomObj:=ie.Document
				
			Length:=AllItems.Length
			loop, % Length
			{
					ToolTip, %A_index%
				if (instr(AllItems[A_Index-1].ID,ElementID))
				{
					my_element:=DomObj.getElementById(ElementID)
					
					if (Action="Click")
					{
						WinActivate, File Explorer
						WinMinimize, File Explorer
						clickLast(ElementID, ie, false)
						my_element.focus
						my_element.click()
						Try
							my_element.onClick()
						my_element.FireEvent("OnClick")
						Sleep 600
						IeLoad(Browser)
						return True
					}
						   
					if (Action="Set")
					{
						my_element.focus
						my_element.value:=ValueToSet
						Sleep, 50
						Try
						my_element.onChange()
						my_element.FireEvent("onChange")
						IeLoad(Browser)
						return True
					}
						   
					if (Action="Get")
					{
						try {
							value:=my_element.value
							return my_element.value
						} catch e {
							value:= my_element.innerText
							return my_element.innerText
						}
					}
				}
			}
		}
	}
	
	if (Type = "Name") {
		Try
		{
			AllItems:=ie.Document.getElementsByTagName(ElementTag)
			DomObj:=ie.Document
			
			
			Length:=AllItems.Length
			loop, % Length
			{
				Haystack:= AllItems[A_index-1].OuterHtml
				Needle =  name=`"%ElementID%`"
				if (instr(AllItems[A_index-1].OuterHtml,ElementID))
				{
					my_element:=DomObj.getElementsByTagName(ElementTag)[A_index-1]
					ClickElement:=DomObj.getElementsByTagName(ElementID)
					
					if (Action="Click"){
						WinActivate, File Explorer
						WinMinimize, File Explorer
						clickLast(ElementID, ie, false)
						my_element.focus
						my_element.click()
						try
							my_element.onClick()
						my_element.FireEvent("OnClick")
						Sleep 600
						IeLoad(Browser)
						return True
					}
						   
					if (Action="Set"){
						my_element.focus
						my_element.value:=ValueToSet
						Sleep, 50
						my_element.onChange()
						my_element.FireEvent("onChange")
						IeLoad(Browser)
						return True
					}
						   
					if (Action="Get"){
						try {
							value:=my_element.value
							return my_element.value
						} catch e {
							value:= my_element.innerText
							return my_element.innerText
						}
					}
				}
			}
		}
	}
 return false
}

ClickLast(ElementID, Browser, iframe){ ;Still Under Construction
	
	if (iframe = TRUE) 
	{
		AllItems:=Browser.Document.getElementsByTagName("iFrame")
		Length:=AllItems.Length
	 
		loop, % Length
		{
			if (instr(AllItems[A_Index-1].ID,ElementID) && isObject(AllItems[A_Index-1].contentdocument.getElementById(ElementID))){
				AllItems[A_Index-1].contentdocument.getElementById(elementID).Click()
				IeLoad(Browser)
				return True
			}
		}
	} else {
		AllItems:=Browser.Document.getElementsByTagName("*")
		Length:=AllItems.Length
		DomObj:=ie.Document
		
		loop, % Length
		{
			if (instr(AllItems[A_Index-1].ID,ElementID) && isObject(DomObj.getElementById(ElementID))){
				DomObj.getElementById(elementID).Click()
				IeLoad(Browser)
				return True
			}
		}
	}
 return False
}

FindElement(Document, ElementName, ElementType, Index:=0, TagName:="*", LikeMatch:=False){ ; Still Under Construction
 /*
  Function Details:
   Returns an Element Object
   Parameter 1: Pointer to an IE.Document
   Parameter 2: The ElementName you are searching for
    If you are searching for the: text, alt, value, innertext or title properties this is value you are looking for
   Parameter 3: The ElementType you are looking for
    Valid Parameters: ID, Name, ClassName,Text, Alt, Value, InnerText or Title. All parameters are strings.
   Parameter 4 (Optional): This is the index number for getElementsByName/ClassName. 
    Default value is 0 (first item)
   Parameter 5 (Optional): This is the TagName keyword to reduce the search space in getElementsbyTagName. 
    Default value is everything ("*")
 */

  loop, 10
  {
   try
   {
    SubDocument:= Document.getElementsbyTagName("iFrame")[A_Index-1].contentdocument
    FindElement:=FindElement(SubDocument,ElementName,ElementType,Index,TagName,LikeMatch)
    if isObject(FindElement){
     FindElement.Focus()
     return FindElement
    }
   }
  } 

  if (LikeMatch=True){
   AllItems:=Document.Body.getElementsbyTagName(TagName)
   Length:=AllItems.Length

   Loop, %Length%
   {
    try
    {
     if (ElementType="ID" && instr(AllItems[A_Index-1].ID,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Name" && instr(AllItems[A_Index-1].Name,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="ClassName" && instr(AllItems[A_Index-1].Class,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Value" && instr(AllItems[A_Index-1].Value,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Alt" && instr(AllItems[A_Index-1].Alt,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Text" && instr(AllItems[A_Index-1].Text,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Title" && instr(AllItems[A_Index-1].Title,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="InnerText" && instr(AllItems[A_Index-1].InnerText,ElementName))
      return AllItems[A_Index-1]
     
     if (ElementType="Href" && instr(AllItems[A_Index-1].href,ElementName))
      return AllItems[A_Index-1]
    }
   }
  } 
  
  if (LikeMatch=False){
    if (ElementType="Name" && isobject(Document.getElementsbyName(ElementName)[Index]))
     return Document.getelementsbyName(ElementName)[Index]
    if (ElementType="ClassName" && isObject(Document.getElementsbyClassName(ElementName)[Index]))
     return Document.getElementsbyClassName(ElementName)[Index]
    if (ElementType="ID" && isObject(Document.getElementbyID(ElementName)))
     return Document.getElementbyID(ElementName)
   
   AllItems:=Document.Body.getElementsbyTagName(TagName)
   Length:=AllItems.Length
   
   Loop, %Length%
   {
    try
    {
     if (ElementType="Text" && AllItems[A_Index-1].text=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="Value" && AllItems[A_Index-1].value=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="Alt" && AllItems[A_Index-1].alt=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="Title" && AllItems[A_Index-1].title=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="InnerText" && AllItems[A_Index-1].InnerText=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="Href" && AllItems[A_Index-1].href=ElementName)
      return AllItems[A_Index-1]
     
     if (ElementType="TabIndex" && AllItems[A_Index-1].TabIndex=ElementName)
      return AllItems[A_Index-1]
    }
   }
  }
 }
}

;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
; FUNCTIONS
;******************************************************************************************************************************************************************
;******************************************************************************************************************************************************************
{

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

SubGroupCount(SG1, SG2, SG3, SG4, SG5, SG6) {
	/*
		This function covers the counting of subgroups entered into the gui. this allows us to understand how many times to loop the actions listed in the Validations quickpad for closing these groups.
	*/
	if !(SG1 = "")
		SGLength.push(SG1)
	if !(SG2 = "")
		SGLength.push(SG2)
	if !(SG3 = "")
		SGLength.push(SG3)
	if !(SG4 = "")
		SGLength.push(SG4)
	if !(SG5 = "")
		SGLength.push(SG5)
	if !(SG6 = "")
		SGLength.push(SG6)
		return
	}
}





















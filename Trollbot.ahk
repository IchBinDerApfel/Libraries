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

; Author: Brad O'Neal

{
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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

Loop
{	

{
MsgBox, 36, (^.^), Do you know what time it is?
	IfMsgBox Yes
	{	
		MsgBox, 64, (0-0), Oh..well good for you then.
		
	}	
	else
	{
		run iexplore.exe https://www.google.com/#spf=1
		WinWait, Google - Internet Explorer
		wb := IEGet("Google")
		wb.Document.getElementsByTagName("INPUT")[2].value := "What time is it?"
		
		wb.document.getElementsByTagName("INPUT")[5].focus
		
		Sleep, 500
		send, {enter}
		
	}
}

Sleep, 30000

{
MsgBox, 36, (o.O), Did you know that Pistachios have to be transported in small batches for fear they may spontaniously combust in greater numbers?
	IfMsgBox Yes
	{
		MsgBox, 48, (@.@), Oh... Wait.. Really? Huh. Fine then.
	}
	else
	{
		run iexplore.exe https://www.google.com/#spf=1
		WinWait, Google - Internet Explorer
		wb := IEGet("Google")
		wb.Document.getElementsByTagName("INPUT")[2].value := "pistachios combustion"
		
		wb.document.getElementsByTagName("INPUT")[5].focus
		
		Sleep, 500
		send, {enter}
	}
}

Sleep, 30000

{
MsgBox, 36, ([]_[]), Would you like to know the weather?	

	IfMsgBox No
	{
		MsgBox, 48, (|_|), I was just TRYING to be helpful.
	}
	else
	{
		run iexplore.exe https://www.google.com/#spf=1
		WinWait, Google - Internet Explorer
		wb := IEGet("Google")
		wb.Document.getElementsByTagName("INPUT")[2].value := "Weather near me"
		
		wb.document.getElementsByTagName("INPUT")[5].focus
		
		Sleep, 500
		send, {enter}
	}	
}	

Sleep, 30000

{
MsgBox, 36, (>.>), Have you ever used the Cleverbot? It's pretty cool.
	IfMsgBox, Yes
	{
		
		MsgBox, 36, (<.<), Oh. Well. Would you like me to take you there?
			IfMsgBox, Yes
			{
				run, iexplore.exe https://www.cleverbot.com
				
			}
			else
			{
				MsgBox, 48, (*-*), Oh. Okay. It would have been fun.
			}
			
	}
	else 
		MsgBox, 4, (^.^), Oh? It's REALLY cool! Want to try it?
		IfMsgBox, Yes
		{
			run, iexplore.exe https://www.cleverbot.com
			
		}
		else
		{
			MsgBox, 48, (._.), You don't seem to have much of a sense of adventure`, do you?
		}
	Sleep, 1000	
}	

Sleep, 30000

{
MsgBox, 36, (<>.<>), Have you ever heard of "Quantum Entanglement"?`nIt's really cool.
	IfMsgBox, Yes
	{
		MsgBox, 48, (<->_<->), How does it feel to be an insufferable know-it-all?
	}
else
	MsgBox, 36, (<+>o<x>), Would you like to know more? It's incredibly interesting stuff!
		IfMsgBox, Yes
		{
			run iexplore.exe https://www.google.com/#spf=1
			WinWait, Google - Internet Explorer
			wb := IEGet("Google")
			wb.Document.getElementsByTagName("INPUT")[2].value := "Quantum Entanglement"
			
			wb.document.getElementsByTagName("INPUT")[5].focus
			
			Sleep, 500
			send, {enter}
		}		
	else
	{
		MsgBox, 48, (&_&), ...
	}	
Sleep, 30000
}	
{
MsgBox, 36, ={^-`,-^}=, Do you like dank memes? I like dank memes.
	IfMsgBox, Yes
	{
		MsgBox, 48, ={^Oo^}=, Well lets look at dank memes together!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!, 4
		{
		run iexplore.exe https://www.google.com/#spf=1
		WinWait, Google - Internet Explorer
		wb := IEGet("Google")
		wb.Document.getElementsByTagName("INPUT")[2].value := "Dank Memes"
		
		wb.document.getElementsByTagName("INPUT")[5].focus
		
		Sleep, 500
		send, {enter}
		}	
	}	
	else
	{
		MsgBox, 48, ={^.\_/.^}=, YOU WILL LOOK AT DANK MEMES WITH ME!!!!!!!!!!!!!!!!!!!!!, 4
		{
		run iexplore.exe https://www.google.com/#spf=1
		WinWait, Google - Internet Explorer
		wb := IEGet("Google")
		wb.Document.getElementsByTagName("INPUT")[2].value := "Dank Memes"
		
		wb.document.getElementsByTagName("INPUT")[5].focus
		
		Sleep, 500
		send, {enter}
		}	
	}
}	
Sleep, 30000	

{
MsgBox, 36, ={^oO^}=, Want to see a neat trick that I learned from ObiRob Kenobi?
	IfMsgBox, Yes
	{
		MsgBox, 0, ={^oo^}=, Watch and be AMAZED!
		run, rudebotROB.ahk
	}
	else
	{
		MsgBox, 48, ={^u.o^}=, Fine... But just know.. It's a really cool trick and you are missing out.. Jerk.
	}
}

Sleep, 30000

{
MsgBox, 36, ={^..^}=, Did you notice that I am a cat now?
	IfMsgBox, yes
	{
		MsgBox, 0, ={^g`,g^}=, You... you did?   *sniffle* I.. I don't know what to say.
	}
	Else
	{
		MsgBox, 16, ={^`;_`;^}=, I didn't think that you would.
	}
}

Sleep, 30000

{
MsgBox, 16, ={^>-<^}=, , 4
;~ Run, Calculator.exe
}	

Sleep, 30000

}

{
Esc::
MsgBox, 16, ={^x_x^}=, Error D9V90I-98DSVSDV-89, 2
MsgBox, 64, [][][][][][]][][][][][][]]]][[][]][][][], INitializing DEBUG interFace..., 2
Gui, Add, Button, x2 y0 w100 h30 g1 , Eins
Gui, Add, Button, x102 y0 w100 h30 g2 , Zwei
Gui, Add, Button, x202 y0 w100 h30 g3 , Drei
Gui, Add, Button, x2 y30 w100 h30 g4 , Vier
Gui, Add, Button, x102 y30 w100 h30 g5 , Funf
Gui, Add, Button, x202 y30 w100 h30 g6 , Sechs
Gui, Add, Button, x2 y60 w100 h30 g7 , Sieben
Gui, Add, Button, x102 y60 w100 h30 g8 , Acht
Gui, Add, Button, x202 y60 w100 h30 g9 , Neun
Gui, Color, Black
Gui, Show, w308 h95, Debug Restore?
return


1:
MsgBox, 262192, Zeit, ...NULL VALUE RETURN///ERROR.NOT.RESOLVED_FURTHER.APP.DECAY.DETECTED\\\
run, Calculator.exe
return

2:
MsgBox, 16, Ich Kannst Nicht, ///PLEASE SOLVE///
run, padlock.ahk
return

3:
MsgBox, 48, []][[]]]], 54132wdw--	DFVD---ZX--`n`nERROR///............%scriptfail%, 5
return

4:
MsgBox, 16, ///error////, the princess is in another castle, 1
return

5:
MsgBox, 48, , SYSTEM DEBUG SCRIPT ACCEPTED...NOW RUNNING RESTORE.
Gui, destroy
return

6:
MsgBox, 0, , all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy all work and no play makes jack a dull boy
return

7:
MsgBox, 64, //\\//\\//\\, `;<<< ░░ ░░░▄ ░░░░░░░░░   ▄ `n`;░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌ `n`;░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐ `n`;░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ `n`;░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ `n`;░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌ `n`;░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌ `n`;░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ `n`;░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ `n`;░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ `n`;▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐ `n`;▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌ Wow. Such Code.`n`;▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ `n`;░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌ `n`;░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐ `n`;░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌ `n`;░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ `n`;░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄—
return

8:
Gui,1:Add,Progress,    x10  y10 w400 h20  vPRBAR 
Gui,1:Add,Text, cBlack x10  y10 w400 h20 +0x200 +Center +BackgroundTrans vText22,        ;here empty 
Gui,1:Show, w400 h50 , Restoring   Corrupt Files
loop, 100
{
 GuiControl,, PRBAR, +1
 GuiControl,1:,Text22,%A_Index%    ;to fill progressbar later
 sleep, 50
	
Gui, Timer: 
}
return

9:
MsgBox, 48, SYSTEM FAILURE, /////APP.FAILURE_ENDING.SCRIPT//, 2
ExitApp
}	




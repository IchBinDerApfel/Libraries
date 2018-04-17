
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

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent


Gui, Add, Button, x12 y12 w30 h30 vB1 gTheseHereButtons,
Gui, Add, Button, x52 y12 w30 h30 vB2 gTheseHereButtons,
Gui, Add, Button, x92 y12 w30 h30 vB3 gTheseHereButtons,
Gui, Add, Button, x12 y52 w30 h30 vB4 gTheseHereButtons,
Gui, Add, Button, x52 y52 w30 h30 vB5 gTheseHereButtons,
Gui, Add, Button, x92 y52 w30 h30 vB6 gTheseHereButtons,
Gui, Add, Button, x12 y92 w30 h30 vB7 gTheseHereButtons,
Gui, Add, Button, x52 y92 w30 h30 vB8 gTheseHereButtons,
Gui, Add, Button, x92 y92 w30 h30 vB9 gTheseHereButtons,
Gui, color, green
Gui, Show, x127 y87 h150 w200, Tik-Tak-Toe
Winning_Moves := "123,456,789,147,258,369,159,357"
Return
 
TheseHereButtons:
    Go(A_GuiControl,"X")
    GoSub MyMove
Return
 
MyMove: 	
    Went=0
    Loop, parse, Winning_Moves,`,
    {
        Current_Set := A_LoopField
        X:=O:=0
        Loop, parse, Current_Set
        {
            GuiControlGet, Char,,Button%A_LoopField%
            If ( Char = "O" )
                O++
            If ( Char = "X" )
                X++
        }
        If ( O = 2 and X = 0 ) or ( X = 2 and O = 0 ){
            Finish_Line(Current_Set)
            Went = 1
            Break 	
        }
    }
    If (!Went)
        GoSub RandomMove
Return
 
Go(Control,chr){
    GuiControl,,%Control%, %chr%
    GuiControl,Disable,%Control%
    GoSub, CheckWin
}
 
CheckWin:
    Loop, parse, Winning_Moves,`,
    {
        Current_Set := A_LoopField
        X:=O:=0
        Loop, parse, Current_Set
        {
            GuiControlGet, Char,,Button%A_LoopField%
            If ( Char = "O" )
                O++
            If ( Char = "X" )
                X++
        }
        If ( O = 3 ){
            Msgbox The AI Wins!
            GoSub DisableAll
            Break
        }
        If ( X = 3 ){
            MsgBox You Win!
            GoSub DisableAll
            Break
        }
    }
return
 
DisableAll:
    Loop, 9
        GuiControl, Disable, Button%A_Index%
return
 
Finish_Line(Set){ 
    Loop, parse, set
    {
        GuiControlGet, IsEnabled, Enabled, Button%A_LoopField%
        Control=Button%A_LoopField%
        If IsEnabled
            Go(Control,"O")
    }
}
 
RandomMove:
    Loop{
        Random, rnd, 1, 9
        GuiControlGet, IsEnabled, Enabled, Button%rnd%
        If IsEnabled
        {
            Control=Button%rnd%
            Go(Control,"O")
            Break
        }
    }
return
 

Esc::
gui, Destroy
run, TikTakToe.ahk
Return
 
GuiClose:
ExitApp






























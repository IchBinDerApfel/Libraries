#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

IfWinNotExist, WINDOWNAME
	{
	msgbox Please VERB WINDOWNAME and then restart Ping!
	ExitApp
	}
Else
	{
		Gui, Add, text,,Ping! For APPLICATION/WINDOWNAME
		Gui, show,, ({o})

		Sleep, 1000

		WinMinimize, ({o})

		Loop
		{

			IfWinExist, WINDOWNAME
			try
			{
				ControlSend, , {F5}, WINDOWNAME
			}
			Catch
			{
				msgbox BOOM!! Error.
						return
			}


			Sleep, 300000
		}
	}


GuiClose:
ExitApp






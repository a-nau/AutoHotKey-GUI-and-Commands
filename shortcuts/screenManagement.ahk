; Created by Alexander Naumann

;-------------------------------------------------------------------------------
; SHORTCUTS
; !=alt, #=windows, ... see https://www.autohotkey.com/docs/Hotkeys.htm
; combine two keys with & or concatenate
;-------------------------------------------------------------------------------

; distinguish single, double, tripple press (https://autohotkey.com/board/topic/98713-how-to-differentiate-double-and-triple-press/)
$Home::
	if winc_presses > 0 ; SetTimer already started, so log keypress instead
	{
		winc_presses += 1
		Return
	}
	Else
	{
		; Else, this is first press of a new series. Set count to 1 and start timer
		winc_presses = 1
		SetTimer, HomePresser, %KeyWaitTime% ; Wait 600ms for more presses
		Return
	}

HomePresser:
	SetTimer, HomePresser, off
	if winc_presses = 1 ; The key was pressed once
		{
			
		}
	Else if winc_presses = 2 ; The key was pressed twice
		{
		Send {Home}
		}
	Else if winc_presses = 3 ; The key was pressed thrice	
		{

		}
	winc_presses = 0
	Return
	
	
;-------------------------------------------------------------------------------
; Navigation
;-------------------------------------------------------------------------------

Home & h::MouseMove, -MouseDistance, 0, 0, R
Home & j::MouseMove, 0, MouseDistance, 0, R
Home & k::MouseMove, 0, -MouseDistance, 0, R
Home & l::MouseMove, MouseDistance, 0, 0, R
Home & Enter::MouseClick, left
Home & Space::MouseClick, right
Home & t::!F4
Home & Left::#+Left
Home & Right::#+Right
Home & Up::
	Send #^{Right}
	; needed since otherwise lead key gets stuck
	SetTimer, HomePresser, 0
	Sleep 50
	return 
Home & Down::
	Send #^{Left}
	; needed since otherwise lead key gets stuck
	SetTimer, HomePresser, 0
	Sleep 50
	return 
; center mouse over active window
Home & n::
	WinGetPos , , , Width, Height, A
	mousemove, (width/2), (height/2)
	
	
;-------------------------------------------------------------------------------
; Misc
;-------------------------------------------------------------------------------
; copy current link from firefox (https://www.autohotkey.com/boards/viewtopic.php?p=313553#p313553)
#If !WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe C:\Program Files\Joplin\Joplin.exe")
{
	Home & c::
		WinGetClass, prevActiveWindow, A
		Sleep, 100
		WinActivate, ahk_class MozillaWindowClass
		Sleep, 100
		save_url_to_clipboard()
		Sleep, 100
		WinActivate, ahk_class %prevActiveWindow%
		;MsgBox, %Clipboard%
		prevActiveWindow =
		Return
}

#If WinActive("ahk_class Chrome_WidgetWin_1 ahk_exe C:\Program Files\Joplin\Joplin.exe")
{
	Home & c::
		WinActivate, ahk_class MozillaWindowClass
		save_url_to_clipboard()
		Sleep, 100
		WinActivate, ahk_exe C:\Program Files\Joplin\Joplin.exe
		Sleep, 100
		SendInput %Clipboard%
		Return
}

; needed since otherwise all following commands will be subject to this
#If
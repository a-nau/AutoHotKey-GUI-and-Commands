; Created by Alexander Naumann

;-------------------------------------------------------------------------------
; SHORTCUTS
; !=alt, #=windows, ... see https://www.autohotkey.com/docs/Hotkeys.htm
; combine two keys with & or concatenate
; use 'getclass' to see ahk_class
;-------------------------------------------------------------------------------

; double press to use normal version (https://www.autohotkey.com/boards/viewtopic.php?t=10067)

	
	
; distinguish single, double, tripple press (https://autohotkey.com/board/topic/98713-how-to-differentiate-double-and-triple-press/)
$End::
	if winc_presses > 0 ; SetTimer already started, so log keypress instead
	{
		winc_presses += 1
		Return
	}
	Else
	{
		; Else, this is first press of a new series. Set count to 1 and start timer
		winc_presses = 1
		SetTimer, EndPresser, %KeyWaitTime% ; Wait 600ms for more presses
		Return
	}

EndPresser:
	SetTimer, EndPresser, off
	if winc_presses = 1 ; The key was pressed once
		{

		}
	Else if winc_presses = 2 ; The key was pressed twice
		{
		Send {End}
		}
	Else if winc_presses = 3 ; The key was pressed thrice	
		{

		}
	winc_presses = 0
	Return


;-------------------------------------------------------------------------------
; Specify Application shortcuts here
;-------------------------------------------------------------------------------
End & d::#6
End & f::WinOpenOrActivateExe("C:\Program Files\Mozilla Firefox\firefox.exe")
End & g::WinOpenOrActivate("ahk_class CabinetWClass", "explorer")
End & t::WinOpenOrActivateExe("C:\Program Files\Mozilla Thunderbird\thunderbird.exe")
End & w::WinOpenOrActivate("ahk_class OpusApp", "WINWORD")


;-------------------------------------------------------------------------------
; Other
;-------------------------------------------------------------------------------
End & Right::
	Send {Alt down}{Tab}{Alt up}
	return
	
End & Left::
	Send {Alt down}{Shift down}{Tab}{Shift up}{Alt up}
	return
	
End & Up::
	Send {Control down}{Tab}{Control up}
	return
	
End & Down::
	Send {Control down}{Shift down}{Tab}{Shift up}{Control up}
	return

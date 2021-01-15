; Created by Alexander Naumann

;-------------------------------------------------------------------------------
; SHORTCUTS
; !=alt, #=windows, ... see https://www.autohotkey.com/docs/Hotkeys.htm
; combine two keys with & or concatenate
; use 'getclass' to see ahk_class
;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------
; Specify Application shortcuts here
;-------------------------------------------------------------------------------
CapsLock & f::WinOpenOrActivateExe("C:\Program Files\Mozilla Firefox\firefox.exe")
CapsLock & g::WinOpenOrActivate("ahk_class CabinetWClass", "explorer")
CapsLock & t::WinOpenOrActivateExe("C:\Program Files\Mozilla Thunderbird\thunderbird.exe")
CapsLock & w::WinOpenOrActivate("ahk_class OpusApp", "WINWORD")


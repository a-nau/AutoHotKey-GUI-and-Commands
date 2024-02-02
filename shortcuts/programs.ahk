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
CapsLock & f::WinOpenOrActivateExe("C:\Program Files\Google\Chrome\Application\chrome.exe")
CapsLock & g::WinOpenOrActivate("ahk_class CabinetWClass", "explorer")
CapsLock & i::WinOpenOrActivateExe("C:\Program Files\Microsoft VS Code\Code.exe")
CapsLock & s::run "https://www.perplexity.ai/"
; outlook
CapsLock & e::WinOpenOrActivate("ahk_class rctl_renwnd32", "outlook")




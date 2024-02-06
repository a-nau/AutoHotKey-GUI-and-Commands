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
CapsLock & v::WinOpenOrActivateExe("C:\Program Files\Microsoft VS Code\Code.exe")



; VS Code
#If WinActive("ahk_exe C:\Program Files\Microsoft VS Code\Code.exe")
{
    CapsLock & 6::^+e  ; switch/open editor
    CapsLock & 7::^+e  ; switch/open explorer/project files
    CapsLock & 8::^+g  ; switch/open git
    CapsLock & 9::^`  ; switch/open terminal
    CapsLock & 0::^+f  ; switch/open terminal

    CapsLock & r::  ; switch to Chrome and refresh
        WinOpenOrActivateExe("C:\Program Files\Google\Chrome\Application\chrome.exe")
        Sleep 100
        Send {F5}  ; refresh
        Sleep 100
        WinOpenOrActivateExe("C:\Program Files\Microsoft VS Code\Code.exe")
        return
}
#If

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
CapsLock & e::WinOpenOrActivate("ahk_class OlkWV2Frame", "outlook")
CapsLock & f::WinOpenOrActivateExe("C:\Program Files\Google\Chrome\Application\chrome.exe")
CapsLock & g::WinOpenOrActivate("ahk_class CabinetWClass", "explorer")
; CapsLock & i::WinOpenOrActivate("ahk_class Chrome_WidgetWin_1", "Slack")
CapsLock & s::run "https://www.perplexity.ai/"
; outlook
CapsLock & t::WinOpenOrActivate("ahk_class CASCADIA_HOSTING_WINDOW_CLASS", "Windows Powershell")
CapsLock & v::WinOpenOrActivateExe("C:\Program Files\Microsoft VS Code\Code.exe")
CapsLock & d::WinOpenOrActivate("ahk_class MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")



; VS Code
#If WinActive("ahk_exe C:\Program Files\Microsoft VS Code\Code.exe")
{
    CapsLock & 6::^+e  ; switch/open editor
    CapsLock & 7::^+e  ; switch/open explorer/project files
    CapsLock & 8::^+g  ; switch/open git
    CapsLock & 9::^`  ; switch/open terminal
    CapsLock & 0::^+f  ; switch/open terminal
    CapsLock & t::^F4  ; close tab

    CapsLock & r::  ; switch to Chrome and refresh
        WinOpenOrActivateExe("C:\Program Files\Google\Chrome\Application\chrome.exe")
        Sleep 100
        Send {F5}  ; refresh
        Sleep 100
        WinOpenOrActivateExe("C:\Program Files\Microsoft VS Code\Code.exe")
        return

    CapsLock & w::  ; switch to Chrome and refresh
        Send, ^w ; This sends Ctrl+W
        Sleep, 100 ; Waits for 100 milliseconds to ensure the first command is processed
        Send, w ; This sends the W key
        return
}
#If

; Firefox Codeserver
#If WinActive("ahk_exe C:\Program Files\Mozilla Firefox\firefox.exe")
{
    CapsLock & 6::^+e  ; switch/open editor
    CapsLock & 7::^+e  ; switch/open explorer/project files
    CapsLock & 8::^+g  ; switch/open git
    CapsLock & 9::^`  ; switch/open terminal
    CapsLock & 0::^+f  ; switch/open terminal
    CapsLock & t::^F4  ; close tab
    ^+p::F1 ; command thing

    CapsLock & w::  ; switch to Chrome and refresh
        Send, ^w ; This sends Ctrl+W
        Sleep, 100 ; Waits for 100 milliseconds to ensure the first command is processed
        Send, w ; This sends the W key
        return
}
#If
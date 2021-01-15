; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
!CapsLock::
    GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return


; A function to escape characters like & for use in URLs.
uriEncode(str) {
    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}


;-------------------------------------------------------------------------------
; UTILS
;-------------------------------------------------------------------------------

WinOpenOrActivate(WinTitle, Target){
    ; https://www.autohotkey.com/docs/misc/WinTitle.htm#ahk_class
    ; https://autohotkey.com/board/topic/79159-run-application-if-not-active-activate-window-if-active/
    IfWinExist, %WinTitle%
        IfWinActive, %WinTitle%
        {
            WinMinimize %WinTitle% ; see http://ahkscript.org/docs/misc/WinTitle.htm#ActiveWindow
            WinActivate, ahk_class Shell_TrayWnd
        }
        Else
            WinActivate, %WinTitle%
    else
        Run, %Target%
}

WinOpenOrActivateExe(Target){
    IfWinExist, ahk_exe %Target%
        IfWinActive, ahk_exe %Target%
        {
            WinMinimize ahk_exe %Target% ; see http://ahkscript.org/docs/misc/WinTitle.htm#ActiveWindow
            WinActivate, ahk_class Shell_TrayWnd
        }
        Else
            WinActivate, ahk_exe %Target%
    else
        Run, %Target%
}


; Save Browser URL to clipboard
save_url_to_clipboard(){
    Clipboard := ""
    Send ^l  ; go to address bar
    while !Clipboard {
        Sleep, 50
        Send ^c
    }
    Sleep, 50
    WinGetActiveTitle, title
    Clipboard := "[" . title . "](" . Clipboard . ")"
    ;MsgBox, % Clipboard
}
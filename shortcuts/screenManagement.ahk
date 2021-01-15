; Created by Alexander Naumann

;-------------------------------------------------------------------------------
; SHORTCUTS
; !=alt, #=windows, ... see https://www.autohotkey.com/docs/Hotkeys.htm
; combine two keys with & or concatenate
;-------------------------------------------------------------------------------
    


;-------------------------------------------------------------------------------
; Navigation
;-------------------------------------------------------------------------------

; move the mouse
CapsLock & h::MouseMove, -MouseDistance, 0, 0, R
CapsLock & j::MouseMove, 0, MouseDistance, 0, R
CapsLock & k::MouseMove, 0, -MouseDistance, 0, R
CapsLock & l::MouseMove, MouseDistance, 0, 0, R

; center mouse over active window
CapsLock & n::
    WinGetPos , , , Width, Height, A
    mousemove, (width/2), (height/2)
    return

; jump between desktops
CapsLock & 2::
    Send #^{Right}
    Sleep 50
    return 
CapsLock & 1::
    Send #^{Left}
    Sleep 50
    return 

; move windows across monitors
CapsLock & Left::#+Left
CapsLock & Right::#+Right
    
    
;-------------------------------------------------------------------------------
; Misc
;-------------------------------------------------------------------------------
; copy current link from firefox (https://www.autohotkey.com/boards/viewtopic.php?p=313553#p313553)
CapsLock & c::
    WinGetClass, prevActiveWindow, A
    Sleep, 100
    WinActivate, ahk_class MozillaWindowClass
    Sleep, 100
    save_url_to_clipboard()
    Sleep, 100
    WinActivate, ahk_class %prevActiveWindow%
    prevActiveWindow =
    Return

; quick select all and copy
CapsLock & z::
    Send ^a
    Send ^c
    return

; exit application
CapsLock & x::!F4

; press menu key (not available on all keyboards)
CapsLock & [::AppsKey

; emulate alt tab
CapsLock & o::AltTab
; emulate control tab
CapsLock & p::^Tab
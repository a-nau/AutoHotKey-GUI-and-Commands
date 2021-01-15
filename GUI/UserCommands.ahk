; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH ENGINES ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = d%A_Space% ; Search duckduckgo
{
    gui_search_title = Search duckduckgo
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if Pedersen = ahk%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if Pedersen = s%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if Pedersen = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Pedersen = m%A_Space% ; Search GoogleMaps
{
    gui_search_title = Search GoogleMaps
    gui_search("https://maps.google.com/maps?q=REPLACEME")
}
else if Pedersen = I%A_Space% ; Google images
{
    gui_search_title = Search Google Images
    gui_search("https://www.google.com/search?tbm=isch&q=REPLACEME")
}
else if Pedersen = a%A_Space% ; Search Amazon.de
{
    gui_search_title = Search Amazon.de
    gui_search("https://www.amazon.de/s?k=REPLACEME")
}
else if Pedersen = gs%A_Space% ; Google Scholar
{
    gui_search_title = Google Scholar
    gui_search("https://scholar.google.com/scholar?q=REPLACEME")
}
else if Pedersen = teng ; Translate German to English
{
    gui_search_title = German to English
    gui_search("https://translate.google.com/#de/en/REPLACEME")
}
else if Pedersen = tger ; Translate English to Germen
{
    gui_search_title = English to Germen
    gui_search("https://translate.google.com/#en/de/REPLACEME")
}
else if Pedersen = w%A_Space% ; Search Weather
{
    gui_search_title = Weather 
    gui_search("https://duckduckgo.com/?q=REPLACEME+wetter&t=ffab&ia=weather")
}

;-------------------------------------------------------------------------------
;;; SEARCH LOCALLY ;;;
;-------------------------------------------------------------------------------
else if Pedersen = f%A_Space% ; Open  project folder
{
    gui_search_title = Find project folder
    gui_projectsearch("REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://www.reddit.com/r/REPLACEME")
}
else if Pedersen = weather ; Weather Karlsruhe
{
    gui_destroy()
    run "https://duckduckgo.com/?q=karlsruhe+wetter&t=ffab&ia=weather"
}
else if Pedersen = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    ; see https://stackoverflow.com/a/5989317
    If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")
        Run %Clipboard%
    Else
        Run "https://www.google.com/search?num=50&safe=off&site=&source=hp&q=%Clipboard%&btnG=Search&oq=&gs_l="
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Pedersen = flist ; show CSV with folders
{
    gui_destroy()
    run, %TextEditor% "%A_ScriptDir%\Miscellaneous\folders.csv"
}
else if Pedersen = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if Pedersen = host ; Edit host script
{
    gui_destroy()
    run, %TextEditor% "%A_ScriptFullPath%"
}
else if Pedersen = user ; Edit GUI user commands
{
    gui_destroy()
    run, %TextEditor% "%A_ScriptDir%\GUI\UserCommands.ahk"
}
else if Pedersen = shortcuts ; Edit Shortcuts Summary (Markdown)
{
    gui_destroy()
    run, %TextEditor% "%A_ScriptDir%\Miscellaneous\Shortcuts.md"
}
else if Pedersen = getclass ; Show AHK class to use it for activation (only information)
{
    gui_destroy()
    MsgBox, The active window's class is "%activeWindowClass%".    
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = @ ; Email address
{
    gui_destroy()
    Send, my_email_address@gmail.com
}
else if Pedersen = name ; My name
{
    gui_destroy()
    Send, My Full Name
}
else if Pedersen = phone ; My phone number
{
    gui_destroy()
    SendRaw, +45-12345678
}
else if Pedersen = int ; LaTeX integral
{
    gui_destroy()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
}
else if Pedersen = logo ; ¯\_(ツ)_/¯
{
    gui_destroy()
    Send ¯\_(ツ)_/¯
}
else if Pedersen = clip ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = down ; Downloads
{
    gui_destroy()
    run C:\Users\%A_Username%\Downloads
}
else if Pedersen = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if Pedersen = mouse ; Show mouse position
{
    MouseGetPos,X,Y
    gui_destroy()
    Msgbox, Your Cursor is at X: %X% Y: %Y%
}
else if Pedersen = mscreen ; Show mouse position relative to screen
{
    CoordMode, Mouse, Window
    MouseGetPos,X,Y
    gui_destroy()
    Msgbox, Your Cursor is at X: %X% Y: %Y%
}
else if Pedersen = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run %TextEditor% C:\Windows\System32\drivers\etc\hosts
}
else if Pedersen = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Pedersen = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}

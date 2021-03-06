# AutoHotKey GUI and Commands

This project is a modified version of [Public-AutoHotKey-Scripts](https://github.com/plul/Public-AutoHotKey-Scripts) by [Asger Juul Brunshøj](https://github.com/plul).
Also check the original [readme](/Miscellaneous/README_original.md) for more information.

## [Why](https://www.lifehack.org/articles/featured/10-ways-to-use-autohotkey-to-rock-your-keyboard.html) use AHK? 

Using your keyboard more and your mouse less can improve your productivity since it usually takes you much less time.

Check the following Demo: Instead of 
- using your mouse to open FireFox, 
- opening a new tab and 
- typing `www.google.com`

you just press 
- `CAPSLOCK`+`SPACE` (to open the GUI) and then
- `g`+`SPACE` (to select a Google Search)

(the demo below also shows the `?` command that displays the available options) 

<img src="./img/presentation.gif">


## Features

### GUI
There are numerous other features already implemented, ready to use! 
Always first start the GUI with `CAPSLOCK`+`SPACE` and then choose:
- Search dialogues to quickly search across different sites (always press the key and `SPACE` afterwards)
    - `a`: Amazon
    - `d`: DuckDuckGo
    - `g`: Google
    - `gs`: Google Scholar
    - `i`: Google Images
    - `l`: Google I'm feeling lucky
    - `m`: Google Maps
    - `w`: Weather search
    - `x`: Google in Incognito mode
    - `y`: YouTube
    - `/`: Go to Sub-Reddit
- Translation (additional configuration/changes are possible)
    - `teng`: Translate from German to English
    - `tger`: Translate from English to German
- Pasting 
    - strings with `name`, `phone` (can configure anything)
- Opening of folders and files
    - `down`: opens Downloads folder
    - `f`+`SPACE`: opens dialog for shortcuts to folders (configuration in [`folders.csv`](/Miscellaneous/folders.csv))
    - `rec`: open recycle bin
    - `shortcuts`: opens file containing additional application specific shortcuts
- Miscellaneous
    - `date`: prompts today's date
    - `url`: open browser and load content of clipboard (opens webpage if it is a URL, otherwise opens standard search)
    - `week`: prompts the current week
    - `?`: overview of available commands


### Shortcuts
All shortcuts (as the GUI) are triggered by the `CAPSLOCK` key.
You can specify hot keys for applications [here](./shortcuts/programs.ahk). For example 
- `CAPSLOCK` + `g`: opens the windows file explorer
- `CAPSLOCK` + `w`: opens the MS Word
- ...

Additional shortcuts are for screen management and other stuff, for example
- `CAPSLOCK` + `1`: Switch to the neighboring desktop on the left
- `CAPSLOCK` + `2`: Switch to the neighboring desktop on the right
- `CAPSLOCK` + `n`: centers the mouse over the active window
- `CAPSLOCK` + `x`: closes the active application
- `CAPSLOCK` + `c`: copy current active browser tab link in Markdown format to the clipboard (currently only works with FireFox, but can be changed [here](./shortcuts/screenManagement.ahk#L49))
- ...

In general, these examples are rather to give you some ideas on what is possible.
If you like it, it is probably best to reconfigure those to suit your needs.


## Usage

If you are new to AHK, check out the following [description](https://en.wikipedia.org/wiki/AutoHotkey) and short [tutorial](https://www.autohotkey.com/docs/Tutorial.htm).

To get it up and running
- install [AutoHotKey](https://autohotkey.com/download/) (AHK) version 1 (not v2 beta) and then
- execute `Host.ahk` (by double clicking)

Afterwards to start using it 
- press `CAPSLOCK` + `SPACE` to start the GUI and enter `?` to get an overview of available commands.
- **Note**: Since `CAPSLOCK` is used as a special key, its standard usage is suppressed, but can be recovered using `ALT` + `CAPSLOCK`.

If you have any issues, or if you changed some configuration, simply reload the `Host.ahk` file by double clicking or using the GUI with `CAPSLOCK` + `SPACE` and typing `rel`.
In addition, consider pasting a link (`.lnk` file) to the `Host.ahk` into the Windows auto-start folder (see [here](https://support.microsoft.com/en-us/windows/add-an-app-to-run-automatically-at-startup-in-windows-10-150da165-dcd9-7230-517b-cf3c295d89dd) for instructions) to automatically load the script on start up.

## Credits
Without the great original [repo](https://github.com/plul/Public-AutoHotKey-Scripts), this would not have been possible, since I am not a AHK expert.
In the following you find a short overview of my changes.
### Original version
- very cool GUI that constitutes the heart of the application
- very quick search on several platforms (google, duckduckgo, ...)
- translation between languages
- and more features (paste strings, get week, ...)

### Extension from Original
I customized the GUI commands to serve my needs, so there are substantial differences between the original version and this one. 
Information for further customization can be found in [GUI](./GUI).

In addition to that I added:
- shortcuts for programs and screen management
    - routines to open or activate (if already open) a program
    - screen management shortcuts, such as switching between desktops and moving applications across screens
- [`folders.csv`](./Miscellaneous/folders.csv) where you can specify "keyword - folder path" pairs to open specific folders quickly from within the GUI
- routine to save the URL of the current active tab of Firefox from any application to clipboard
- a very uncomplete [list](./Miscellaneous/Shortcuts.md) of common shortcuts within certain applications I use


## Miscellaneous
I hope you find it helpful and please share any errors/improvements that you spot :)

### Hints for own extensions

AHK scripts use the following [common notation](https://www.autohotkey.com/docs/Hotkeys.htm) 
- `^` = `CRTL`
- `#` = `WINDOWS`
- `+` = `SHIFT`
- `!` = `ALT`

Furthermore,
- `;` is the comment keyword for `ahk` files
- when using conditional statements such as `#If ...`, be aware that they affect the code across files. Use an empty `#If` to stop this.


### Inspiration
- [ahkscript/awesome-AutoHotkey](https://github.com/ahkscript/awesome-AutoHotkey): A curated list of awesome AutoHotkey libraries, library distributions, scripts, tools and resources
- [rcmdnk/vim_ahk](https://github.com/rcmdnk/vim_ahk): Setting file to emulate vim with AutoHotkey 
- [Forks](https://github.com/plul/Public-AutoHotKey-Scripts/network/members) of the original repo
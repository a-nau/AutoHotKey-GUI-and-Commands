# AutoHotKey GUI and Commands

This project is a modified version of [Public-AutoHotKey-Scripts](https://github.com/plul/Public-AutoHotKey-Scripts) by [Asger Juul Brunshøj](https://github.com/plul).
Also check the original [readme](/Miscellaneous/README_original.md) for more information.

## [Why](https://www.lifehack.org/articles/featured/10-ways-to-use-autohotkey-to-rock-your-keyboard.html) use AHK? 

Using your keyboard more and your mouse less improves your productivity, since it usually takes you much less time.

Check the following Demo: Instead of 
- using your mouse to opening FireFox, 
- opening a new tab and 
- typing `www.google.com`

you just press 
- `CAPSLOCK`+`SPACE` and then
- `g`+`SPACE` 

(the demo below also shows the `?` command that displays the available options) 

<img src="./img/presentation.gif">


## Features
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
- Pasting of strings with `name`, `phone` (can configure anything)
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


In addition you can specify hot keys for applications in the directory [shortcuts](./shortcuts), that open applications when combining a lead key (default is `End`) with another key.
For example `End` + `G` opens the windows file explorer.

## Usage

If you are new to AHK, check out the following [description](https://en.wikipedia.org/wiki/AutoHotkey) and short [tutorial](https://www.autohotkey.com/docs/Tutorial.htm).

To get started
- install [AutoHotKey](https://autohotkey.com/download/) (AHK)
- execute `Host.ahk` (by double clicking)

Specify the path to your favorite
- text editor (that opens all text files) in the variable [`TextEditor`](./GUI/GUI.ahk#L46) 
- browser (that opens all searches and links) in the variable [`FireFoxExe`](./GUI/GUI.ahk#L47)

To start the GUI use `CAPSLOCK + SPACE` and enter `?` to get an overview of available commands.
Since `CAPSLOCK` is used as a special key, its standard usage is suppressed, but can be recovered using `ALT + CAPSLOCK`.

In addition you can specify hot keys for applications and windows management in the directory [shortcuts](./shortcuts), where you find more details.
The default lead keys are `Home` and `End`.
To get back their original functionality you need to double press them.

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
- `;` is the comment keyword for `ahk` files
- when using conditional statements such as `#If ...`, be aware that they affect the code across files. Use an empty `#If` to stop this.


### Inspiration
- [ahkscript/awesome-AutoHotkey](https://github.com/ahkscript/awesome-AutoHotkey): A curated list of awesome AutoHotkey libraries, library distributions, scripts, tools and resources
- [Forks](https://github.com/plul/Public-AutoHotKey-Scripts/network/members) of the original repo


### Known Bugs
- the shortcut lead keys `End` and `Home` sometimes get stuck
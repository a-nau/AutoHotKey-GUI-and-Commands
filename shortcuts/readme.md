# Shortcuts
This folder contains standard shortcuts.

## Programs
The [programs.ahk](./programs.ahk) contains shortcuts to open/activate various programs/applications.
The current lead key is `End`, but that can be changed by a simply replacing `End` with the key of your choice in the entire file.
You can use the "replace all" functionality of your text editor for this.

Since everyone uses different programs and paths might be different, I only left a few examples in the [programs.ahk](./programs.ahk), so you get an idea on how to use it.

### How to customize?
There is two options to specify a shortcut for a desired program:
- use `WinOpenOrActiveExe` and just provide the path to the executable
- use `WinOpenOrActive` and provide the `ahk_class` and the executable

Depending on the program at hand, one or the other might work better - so if you have trouble, you best try both.

To find the `ahk_class` of a given application:
- activate the applications window
- start the GUI with `CAPSLOCK` + `SPACE` 
- write `getclass`
- now, the class of the currently active appliciation window is displayed 


## Screen Management
The [screenManagement.ak](./screenManagement.ahk) contains shortcuts to make moving along the screen, switching between windows, etc. easier.
The current lead key for this is `Home`.
Change it by replacing `Home` with the key of your choice.


## Miscellaneous

Since I use a special keyboard, `home`, `end`, `pg up` and `pg down` are very well suited as lead keys.
For standard keyboards, however, you should change this configuration.
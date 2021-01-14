# GUI
Here you find the implementation of the GUI and the definition of the available user commands.

## GUI.ahk
Other changes here are only necessary if you want to change "deeper" functionality.


## UserCommands.ahk
Customize your GUI by specifying searches, etc.

### Online searches
The general structure of a search entry in the GUI is the following
```
else if Pedersen = KEY COMBINATION ; Comment that is visualized in GUI help
{
    gui_search_title = Text that is displayed in the GUI after selection
    gui_search("https://www.my-search.url/results?search_query=REPLACEME")
}
```
e.g. for YouTube search
```
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
```
- `Pedersen` is the text that is first entered into the GUI that specifies the desired search such as Google, YouTube, etc. Here, the text to select the YouTube search is `y ` (`y` and `space`), since `%A_Space%` stands for a `space` character " ".
- `REPLACEME` is the query that is entered for the specific search, e.g. the video name your looking for on YouTube. You need to know the syntax of the search query, since your search text is pasted into the URL at the indicated position.
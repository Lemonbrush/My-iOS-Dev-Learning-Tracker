# Command line

Kernel - Hardware core   
Shell - UI like Finder (GUI) or command line (CLI) that allows us to communicate with Kernel

Bash = Bourne Again Shell

#### Why use the command line?

It is a great way to manipulate system since it has such benefits as:  
- Speed  
- Control  
- Full access to the system 

## Basic Commands

Hints:  
- You can press `up`/`down` buttons to see and execute previous comands  
- Press `Alt` to move carette by the mouse  
- press `Control + A` to move to the beginning of the command line  
- press `Control + E` to move to the ending of the command line
- press `Control + U` to clear command line

**Lists all items in current directory**  

```
ls 
```

**Change directory**  

```
cd *directory name/path*
```  

hints:  
- you can press tab to autocomplete typing directory name   
- you can drag a file into terminal to get its path  

**Return to the previous directory** 

On one level  

```
cd ..
```

To the root directory 

```
cd ~
```

**Clear screen**

```
clear
```

**Create directory**

```
mkdir *directory name*
```

**Create file**

```
touch *file name*.*file type*
```

**Delete files**

```
rm *file name*
```

Delete all files in current directory

```
rm *
```
**Delete Directories**

```
rm -r *directory name*
```

**Open file**

```
open -a *app to use to open it* *file name*
```


## Useful links
- [Full cheatsheet](https://github.com/0nn0/terminal-mac-cheatsheet)
- [Learn Enough Command Line to Be Dangerous](https://www.learnenough.com/command-line-tutorial/basics)
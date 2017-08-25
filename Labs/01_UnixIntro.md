In this lab we will practice basic skills needed to work in a Unix
environment. You may find the following cheat sheets helpful:

-   Unix cheat sheets
    -   <http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/>
    -   <https://files.fosswire.com/2007/08/fwunixref.pdf>
-   Emacs cheat sheet
    -   <https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf>

Navigation
==========

When you first log into the server, you should find yourself in the
directory `~`, which is your home directory. There are two main commands
you can use to navigate around the file hierarchy. Try using `cd` and
`ls` to navigate around the file system we discussed in the lecture.

**Commands:**

-   ls: This is used to list the files in a directory. Use the '-'
    operator to include optional arguments.
    -   `ls`
    -   `ls -a`
    -   `ls -l`
    -   `ls -al`
    -   `ls -lh`
-   pwd: This will return your present working directory.
-   cd: This is used to change directories. You can use `..` to refer to
    a directory above the current directory, and `.` to refer to the
    current directory.
    -   `cd /`
    -   `cd /usr/local`
    -   `cd bin`
    -   `cd ../bioinf`
    -   `cd`

Paths
=====

**Commands:**

-   which: Returns the path to a command.
    -   `which command`
-   echo: Echos whatever is input to the standard output stream.
    -   `echo Hello World`

As we saw above, there are many programs installed on our server. How
does the shell know where to find a program when you call it? Try:

    which blastall

The `which` function will tell us where a command is located.

    which helloworld

The `helloworld` program isn't found, but that doesn't mean it doesn't
exist.

    ls /home/johnson/bin

The shell will only look for things where you have told it to look. Your
default path on this server includes the following locations:

    echo $PATH

So, if you want to run `helloworld`, you need to tell the shell where to
find it:

    /home/johnson/bin/helloworld

Files and directories
=====================

In this section we will create a directory called `subdir` and a few
text files within that directory. We will also practice inspecting them
and take our first look at using the Emacs editor. In your home
directory, create a directory for this week's lab:

    mkdir 552lab01

Creation and deletion of files and directories
----------------------------------------------

**Commands:**

-   cp: Copy a file of directory. If you want to copy a directory, you
    need to use the `-r` option (recursive copy). This will also copy
    files and sub-directories within the copied directory.
    -   `cp file.ori file.new`
-   mkdir: Make a directory.
    -   `mkdir newDirectory`
-   mv: Move a directory or file.
    -   `mv oldFile newFile`
-   rm: Remove a file or directory. If you want to remove a directory,
    you need to use the `-r` option (recursive delete). This will also
    remove files and sub-directories within the deleted directory.
    -   `rm file.txt`
    -   `rm -rf directory`
-   touch: Touch a file and update it's last modified time stamp. If it
    doesn't exist, create an empty file with that name.
    -   `touch file.txt`

Do the following:

-   Create a directory inside of *552lab01* called *subdir*
-   Navigate to *subdir*
-   Create a file called *file.txt* using `touch`
-   Create a copy *file.txt* called *file2.txt*
-   Change the name of *subdir* to *tmpdir*
-   View the *tmpdir* directory to verify that everything was properly
    created
-   Remove everything inside of *tmpdir*, but do not delete *tmpdir*

Viewing and editing files
-------------------------

In this section we will build upon the tools we have covered and
practice viewing / editing files. We will also play a little with file
permissions.

**Commands:**

-   Viewing files
    -   head: Show the first *n* lines of a file (default is 10). Use
        the `-n` option to specify a different number of lines
        to return.
        -   `head file.txt`
        -   `head -n 20 file.txt`
    -   less: View a file with page navigation
        -   `less file.txt`
    -   more: Dump the contents of a file into standard out
        -   `more file.txt`
    -   tail: Show the last *n* lines of a file (default is 10). Use the
        `-n` option to specify a different number of lines to return.
        -   `tail file.txt`
    -   wc: Word count of a file. Returns the number of characters,
        words and lines in the file.
        -   `wc file.txt`
        -   `wc -l file.txt`
-   Editing files using Emacs: open (or create) a file using the
    `emacs` command.
    -   `C-`: Short hand for the control button
    -   `M-`: Short hand for the meta button. This is the command button
        on a Mac, but hitting the escape button will also work in
        most systems.
    -   The bare basics
        -   `C-x C-s` Save the current file
        -   `C-x C-f` Open a new file from within Emacs
        -   `C-x C-c` Exit Emacs
        -   `C-x C-w` Write the current buffer to a file (i.e.
            Save As...)
    -   Navigation
        -   `C-a` Go to the beginning of the line
        -   `C-e` Go to the end of the line
        -   `C-v` Page down
        -   `M-v` Page up
        -   `M-<` Go to beginning of buffer
        -   `M->` Go to end of buffer
        -   `C-x b` Go to a different buffer (so you can have multiple
            files open at a time)
    -   Kill and Yanking (Cut and Paste)
        -   `C-w` Kill a region (cut)
        -   `C-k` Kill to the end of the line (cut)
        -   `C-y` Yank whatever was killed last (paste)
        -   `M-w` Copy a region to the kill ring (copy)
    -   Marking Regions
        -   `C-SPACE` Mark the current spot
        -   `C-x C-x` Swap the mark with the cursor

Do the following:

-   Take a look at */home/johnson/data/PrediceAdClicks/test.csv*.
    -   How big is the file?
    -   How are the data formatted?
    -   How many records are there?
-   We have discovered that the country code for line 478 should
    actually be 'c'. Fix it.
    -   Do you have permission to edit this file?
    -   Should you edit the source data?

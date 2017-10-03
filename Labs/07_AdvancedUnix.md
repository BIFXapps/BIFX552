Permissions
-----------

**Commands:**

-   chmod: Change the permissions of a file for owner, group, and world.
    Common permissions for a file are full permissions for the owner,
    and read/execute permissions for everyone else: 7 (rwx, 4 + 2 + 1),
    5 (rx, 4 + 0 + 1), 5. To change to this, use the command:
    -   `chmod 755 filename`
    -   To calculate permissions:
        -   `4` = read
        -   `2` = write
        -   `1` = execute
        -   `+r` = add read permissions for everyone
        -   `+w` = add write permissions for everyone
        -   `+x` = add execute permissions for everyone
-   chown: Change the owner (and group) of a file.
    -   `chown newOwner file.txt`
    -   `chown newOwner:newGroup file.txt`

Do the following:

-   Change the permissions of your copy of *test.csv* so that you can
    only read, the group can read, and the world can't do anything. You
    should always maintain a clear path back to the source data, and you
    want to avoid changing it permanently.

Redirection
===========

We don't always have time to sit around and babysit a process while it
runs. Also, we often want to capture the output in some meaningful way,
rather than just watching it scroll across the screen.

There are two main streams that programs use to communicate with us:

-   Standard Output: Program output goes here
-   Standard Error: Program errors are sent here

By default, both standard output and standard error are sent to the
terminal window, but we can redirect that output to a file. Some
commands also expect input from you. They can often accept input from a
file, instead.

**Commands:**

-   cat: Send the standard input to standard output. If entering text by
    hand, exit the standard input stream using a new line followed
    by control-D.
    -   `cat file.txt`
    -   `cat`
-   : Redirect the standard output to a file

    -   `command > file.out`
-   2&gt;: Redirect the standard error to a file
    -   `command 2> file.err`
-   &lt;: Set a file as input
    -   `command < inputfile`

Do the following: - Write an R script called *loop.R* using `cat`. It
should have the following commands:

    for(i in 1:10)
        print(i)

-   Run *loop.R* using the following syntax:

        R --no-save < loop.R

-   Redirect the output of *loop.R* to a file, *loop.out*.
-   Edit *loop.R* in Emacs such that the loop now looks like this:

        for(i in 1:10)
        {
        if(i == 8)
            stop("This is an error")

        print(i)
        }

-   Run *loop.R* again with and without redirecting standard out and
    standard error to files (*loop.out* and *loop.err*).

Pipes
=====

A pipes, `|`, similar to redirection, passes the output from one command
as input to another command. This is a powerful tool, as we can stitch
many commands together into a pipeline.

    command1 | command2 | command3

Do the following: - List the contents of the */usr/local/bin* directory
and find all of the commands that contain the term "blast". - There are
a lot of commands! Pass the output from `ls` to `grep`. `grep` will sort
through the files and only pass those to standard out that contain
"blast" in their names. - `ls /usr/local/bin | grep blast`

`grep` and regular expressions can be a powerful tool, and we will
explore them more later on in the course.

Process management
==================

For this next exercise, we will start by modifying *infLoop.R* so that
it runs longer. We will change the `for` loop to an infinite `while`
loop. It will print "Still chugging" to the screen and wait 10 seconds.
Because the statement in the `while` clause is always `TRUE`, it will
never stop unless we kill it.

    while(TRUE)
    {
        Sys.time()
        Sys.sleep(10)
    }

**Commands:**

-   `&`: Runs your command in the background.
    -   `command &`
-   bg: Restart a suspended job in the background.
    -   When a process is actively running in the foreground:
        -   `Ctrl z`
        -   `bg`
-   fg: Move a process to the foreground.
    -   When a process is suspended or is actively running in the
        background:
        -   `fg`
-   ps: Shows your currently running processes.
    -   `ps`
    -   `ps -e`
    -   `ps -f`
-   nohup: Used to disassociate a process from your terminal session.
    Processes started using nohup will persist after your session
    ends (e.g. they won't be killed when you log out). This should be
    used with `&`.
    -   `nohup command1 &`
-   jobs: Lists your jobs. This is similar to `ps`, but it will only
    show the commands you have submitted from the command line.
    -   `jobs`
-   top: Shows all currently running processes. Hit `q` to quit.
    -   `top`
    -   `top -o cpu`
    -   `top -o cpu_me`
    -   `top -o mem`
-   kill: Kills a specific process. The `-9` option will force quit
    a process. You can also use the job number instead of the process
    ID (e.g. `%1`).
    -   `kill processID`
    -   `kill %jobID`

Do the following:

-   Modify *infLoop.R* as described above.
-   Start *infLloop.R*. Once you are tired of watching this run, hit
    `Ctrl z`.
-   Check your current jobs using `jobs`.
-   Move your suspended job to the background using `bg`.
-   You'll notice that it is still sending output to the terminal window
    if you didn't redirect it to a file. Kill your process and start it
    again in the background with proper output redirection.
-   Log out using `exit`. The shell will warn you if you try logging out
    with a suspended job, but it won't usually warn you if you have a
    background process running.
-   Log back in and verify that your process has been killed.
-   Start your process in the background using `nohup` and log
    out again.
-   Log in to verify that your process is still running.
-   Check the output to verify that it is still running properly.

Shortcuts
=========

Here are a few keyboard shortcuts that you may find helpful.

-   Auto completion using `TAB`: When you are typing the name of a long
    file or command, try typing the first few letters and hit TAB. The
    shell will complete the string as best it can. If there is more than
    one possible command/file, it will complete as far as it can. Hit
    TAB again to see all possibilities.
    -   Example: Type `bla` and then `TAB`. Hitting `TAB` again will
        show you all possible completions.
-   `*`: This is a wild card.
    -   Example: `rm *.out` will remove all files in the current
        directory ending with `.out`.
-   History: You can navigate through previous commands using the up and
    down arrows. This is handy if you find yourself rerunning
    long commands.
-   `Ctrl a`: This will move the cursor to beginning of line.
-   `Ctrl e`: This will move the cursor to the end of the line.

Asside on the midterm exam
==========================

The exam will consist of three tasks worth 50 points each, and the
rubric below will be used to grade your midterm exam.

<table>
<thead>
<tr class="header">
<th align="left">Tasks</th>
<th align="left">Skill level</th>
<th align="right">Points</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Code</td>
<td align="left">Appropriate comments</td>
<td align="right">10%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Appropriate indentation</td>
<td align="right">10%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Use of white space</td>
<td align="right">5%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Appropriate vectorization</td>
<td align="right">10%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">File header</td>
<td align="right">5%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Runtime errors in code</td>
<td align="right">-15%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left"></td>
<td align="right"><strong>40%</strong></td>
</tr>
<tr class="even">
<td align="left">Git repository</td>
<td align="left">Proper structure</td>
<td align="right">10%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Clean repository history</td>
<td align="right">10%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Commit only complete work</td>
<td align="right">5%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Commit only related changes</td>
<td align="right">5%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Small commits</td>
<td align="right">5%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Appropriate use of <em>.gitignore</em></td>
<td align="right">5%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left"></td>
<td align="right"><strong>40%</strong></td>
</tr>
<tr class="odd">
<td align="left">R Package</td>
<td align="left">Installs without errors or warnings</td>
<td align="right">10%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Documentation complete</td>
<td align="right">5%</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Appropriate NAMESPACE entries</td>
<td align="right">5%</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left"></td>
<td align="right"><strong>20%</strong></td>
</tr>
</tbody>
</table>

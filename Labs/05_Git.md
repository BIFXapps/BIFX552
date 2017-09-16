Repository creation using GitHub
================================

Create a repository, *firstRepo*, on GitHub and clone it to your home
directory on the server. Let GitHub create an empty *README.md* file
before you clone it.

Project organization
====================

-   Set up a project directory for *firstRepo* using a single command
    (see pg 27 of Buffalo for a hint on how to do this). It should have
    the following subdirectories:
    -   Data
        -   Raw
        -   Intermediate
    -   Output
    -   Scripts

Repository initialization
=========================

There are two ways you can get started with a git repository:
initializing an empty repository, or cloning an existing repository. If
we wanted to make a repository called test, we can either clone my
[test](https://github.com/johnsonra/test) repository, or we could create
an empty one from scratch. For example:

    git clone https://github.com/johnsonra/test

or

    mkdir test
    cd test
    git init

We could make *firstRepo* into a git repository using `git init`, but we
already let GitHub do this for us. Go ahead and clone *firstRepo* onto
your local machine.

Markdown
========

Recreate a markdown file that has displays the following information
(modify *README.md*). You may want to edit this on GitHub, as you can
write markdown code and preview it interactively.

Markdown example (start here)
-----------------------------

This is an example markdown document for our toy repository. Normally
this part of the document would contain an abstract, summary or
introduction to the material covered in the document. You may find [this
cheat
sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
helpful for recreating this document.

This is a new paragraph with *some text in italics* and some text
**bolded**. Here is a table with some of the basic data types in R.

<table>
<thead>
<tr class="header">
<th align="center">Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><code>numeric()</code></td>
<td>real numbers</td>
</tr>
<tr class="even">
<td align="center"><code>integer()</code></td>
<td>integer numbers</td>
</tr>
<tr class="odd">
<td align="center"><code>factor()</code></td>
<td>categorical data</td>
</tr>
<tr class="even">
<td align="center"><code>chatacter()</code></td>
<td>text data</td>
</tr>
<tr class="odd">
<td align="center"><code>data.frame()</code></td>
<td>a data set</td>
</tr>
</tbody>
</table>

Notice that the R code in the table above (e.g. `numeric()`) is
formatted differently than the plain text in the description column. We
could have done this as a list instead.

-   `numeric()`: real numbers
-   `integer()`: integer numbers
-   `factor()`: categorical data
    -   I don't usually like factors, but they do have their place.
        You'll almost always find character variables easier to
        work with.
-   `chatacter()`: text data
-   `data.frame()`: a data set
    -   Or you could use `data_frame()`. I like them better for reasons
        we will discuss later in the course.

### Subsection

Here we have a subsection containing a block quote from
\[@BroadhurstDavid\](<https://twitter.com/BroadhurstDavid>):

> Really Dr. McCoy You must learn to govern your passions; they will be
> your undoing. Logistic Regression suggests...

You can also include a block of R code. Remember this code from last
week?

    while(TRUE)
    {
        Sys.time()
        Sys.sleep(10)
    }

Here is an image by Eagle Genomics Ltd, titled "The Periodic Table of
Bioinformatics". You can find a static copy that was posted on Flickr by
David Hull at
<https://farm8.staticflickr.com/7083/6895371690_112fa838aa_k.jpg>.

![The Periodic Table of Bioinformatics by Eagle Genomics
Ltd.](https://farm8.staticflickr.com/7083/6895371690_112fa838aa_k.jpg)

Staging and committing
======================

Git won't do anything for us, unless we ask it to do so. Commit
*README.md* to our *firstRepo* repository. You will need `git add` and
`git commit` when doing this locally. If you edit the file on GitHub,
you can commit in one step. Other commands that you may find useful at
this stage include:

-   `git status`
-   `git log`
-   `git pull`

Making changes
==============

A simple R script
-----------------

Start by making a simple R script, *script1.R* that creates a pdf figure
from a randomly generated cloud of points. Comment your code to document
what it is doing at each step.

    set.seed(297834) # pick your own seed
    x <- rnorm(100)
    y <- x + rnorm(100)

    pdf('../out1.pdf')
    plot(x, y)
    dev.off()

Get some data
-------------

I've put emergency room visit data for 2016 in *path to dataset* on the
server. Link it to your Data/Raw directory using `ln`. This file is just
over 51 MB, which is on the small side for a data set. The data you will
typically work with probably won't be practical to include in the
repository, and it is likely to be far more sensitive than your code
anyway. My general rule of thumb is never to store data in the cloud.

.gitignore
----------

We also want to ignore certain files by default. What should we include
in our *.gitignore* file? Stage this and commit all the changes we have
made here.

More practice
=============

Go to <http://onlywei.github.io/explain-git-with-d3/#freeplay> and
perform the following tasks in the git simulator. The following commands
are supported:

-   `git commit`: The simulator doesn't support staging files with
    `git add`, and it also doesn't support `git status`. You don't want
    a separate commit for every single little change, but you also don't
    want lots of unrelated changes crammed together into one
    monster commit.
-   `git pull`: You won't need to pull often, since you are the only one
    pushing to the central repository, but you should get in the habit
    of checking for updates using `git pull`.
-   `git push`: Pushing often is a good way to keep things from
    getting messy. If you make a bunch of changes and forget to push
    them, someone else might have also made many changes to the
    central repository. Merging your changes into the central repository
    might not be fun.
-   `git merge`: Try merging some branches or start making a few commits
    before pulling at the beginning. This will allow your local copy to
    get ahead of the central repo.
-   `git branch`: You can create a branch this way or by using
    `git checkout -b`. Pushing branches to the remote repository isn't
    supported in this simulator.
-   `git checkout`: Try using the `-b` option to create a new branch.
    Also, you can try checking out old commits.
-   `git revert`: Try reverting to a commit that is on a
    different branch. What happens?
-   `git rebase`: This is particularly useful if you make changes to a
    major branch (e.g. master) and want to apply those changes to a sub
    branch (e.g. feature).

Inroduction to R
================

During class this week, we will pick up where we left off with our
introduction to R. You will need the data set from the paper from this
week's module, [The Influence of Recombination on Human Genetic
Diversity](http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.0020148).
You can find it at `/home/johnson/data/spencer2006/Dataset_S1.txt`.

You may find the following cheat sheets helpful (see [RStudio's
website](https://www.rstudio.com/resources/cheatsheets/) for more cheat
sheets):

-   [Data
    Import](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-import-cheatsheet.pdf)
-   [Data
    Transformation](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf)
-   [Emacs Speaks
    Statistics (ESS)](http://ess.r-project.org/refcard.pdf)

Before we jump in, do you have any questions?

Discussion of Spencer 2006
--------------------------

You should have a hard copy of the paper marked up from your reading.
Discuss!

Start up R
----------

We want to use R on the server, but working through the terminal can be
a pain. Instead, we will use Emacs and Emacs Speaks Statistics (ESS). We
can work with a slightly nicer GUI on our local machine while running R
and editing files on the server!

### Emacs Speaks Statistics

You can reference the ESS cheat sheet above, but these are some of the
main commands I find to be most helpful.

-   Additional Emacs commands:
    -   `C-x 5 2` Open a new window (doesn't work in the terminal).
    -   `C-x 2` Split the current window into two windows, one atop
        the other.
    -   `C-x 3` Split the current window into two windows, one beside
        the other.
    -   `C-x o` Move focus to the next split window.
    -   `C-x 1` Close all split windows except the current one.
    -   `Command-~` Move focus to the next window (Mac only).
-   ESS Basics:
    -   `M-x R` Start and R session. If you would like to start a remote
        R session, enter a remote directory (e.g. `//username@server:~/`
        will start it up in your home directory).
    -   `C-c C-j` Send the current line to R.
    -   `C-c C-r` Send the current region to R.
    -   `C-c C-b` Send the entire buffer to R.

Start up Emacs and enter the following commands to get an R script open
and attached to a remote R process (replace your username and the server
name where appropriate).

    C-x b lab2.R
    C-x C-w //username@server:~/lab2.R
    C-x 5 2
    M-x R

Verify that you are running on the server by entering the following
command:

    library(tidyverse)

R Commands for this lab
-----------------------

Take a look at the cheat sheets linked above, but these are the specific
commands we will need for this lab.

-   `filter(.data, ...)` Returns a subset of *.data* subject to the
    conditions defined in *...*
-   `gsub(pattern, replacement, x)` Substitute `pattern` with
    `replacement` in each character string of `x`. See `?gsub` for
    more details.
-   `mutate(.data, ...)` Modify a `data_frame` (i.e. change an existing
    variable or add add new variables).
-   `mean(x, na.rm = FALSE)` Returns the mean of x or NA if missing
    values are present. Set `na.rm = TRUE` to ignore missing values.
-   `max(x, na.rm = FALSE)` Returns the maximum of x or NA if missing
    values are present. Set `na.rm = TRUE` to ignore missing values.
-   `min(x, na.rm = FALSE)` Returns the minimum of x or NA if missing
    values are present. Set `na.rm = TRUE` to ignore missing values.
-   `names(x)` Return the names of an object. If you use the assign
    operator, `<-`, you can also use this function to change the names
    of the object.
-   `range(..., na.rm = FALSE)` Returns the minimum and maximum of the
    data or NA if missing values are present. Set `na.rm = TRUE` to
    ignore missing values.
-   `read_csv(file)` Read comma separated values (csv) file into R.
    -   `col_names = TRUE` R will assume a csv file has column names in
        the first row.
    -   `col_types = NULL` R will try to guess the variables types for
        each column, but if it is having trouble, or if you want it to
        run a smidge faster, you can use this to force data types for
        each column. I rarely need to use this.
    -   `na = c("", "NA")` Change this if you have some other code for
        missing values (e.g. `-9`).
    -   `quote = "\""` Change this for alternate quote characters (e.g.
        `'`).
    -   `comment = ""` This will tell R to skip anything on a line after
        this specific character. If blank, it doesn't take comments out.
    -   `skip = 0` Skip the first few lines. This can be useful when
        there are multiline headers in the file.
    -   `n_max = Inf` Use this to limit the number of lines to read in.
    -   `guess_max = min(1000, n_max)` By default, R will use the first
        1000 lines to guess data types for each column. This can
        be modified.
-   `summary(object)` Returns the min, max, quartiles and mean of
    numeric variables, or length, class and mode of other
    variable types.
-   `table(...)` Returns a table containing count data for
    the variable(s) included in *...*

Data wrangling
--------------

The data from Spencer 2006 is nice, but sometimes we end up with
unhelpful formats. Tidy data is key to our ability to easy and efficient
analysis. Hadley Wickham has been pushing the importance of tidy data
for several years now. His 2014 article, [Tidy
Data](https://www.jstatsoft.org/article/view/v059i10) in the Journal of
Statistical Software, drives home the importance of working with tidy
data:

> Happy families are all alike; every unhappy family is unhappy in its
> own way. - Leo Tolstoy

> Like families, tidy datasets are all alike but every messy dataset is
> messy in its own way. Tidy datasets provide a standardized way to link
> the structure of a dataset (its physical layout) with its semantics
> (its meaning).

### Reading in data

Do the following:

-   Before doing any data analysis, you always want to know your data.
    Check out */home/johnson/data/spencer2006/Dataset\_S1.txt* in the
    terminal and answer the following questions:
    -   How is the file formatted?
    -   What data are in each column?
    -   What is used for missing data?
    -   Anything else that we should pay attention to?
-   Set up your script file with appropriate header comments.
-   Load *Dataset\_S1.txt* into R and save it in a variable called
    `dat`.
-   Inspect `dat` to be sure that the data set was properly imported.
    -   Use the following commands to check out the data:
        -   `dat`
        -   `str(dat)`
        -   `table(dat[["total SNPs"]])`
        -   `pdf(); hist(dat[["total SNPs"]]); dev.off()`
        -   `summary(dat[["total Bases"]]`
-   Look good? What if it didn't? Check out the help file for
    `read_csv()` and explore different options.

### Summarizing data

Let's check out the data set to familiarize ourselves a little more with
it. Use the following summary functions to inspect the different
variables:

-   `mean(x)`
-   `summary(x)`
-   `table(x)`
-   `min(x)`
-   `max(x)`
-   `range(x)`

### Changing (mutating) data

Some of the names have spaces or have special characters in them (i.e.
`%GC`). These aren't very nice to work with in R, so lets start by
renaming them. Here is how we would rename `%GC`. Go ahead and rename
the other problematic names as well by simply removing the space.

    args(gsub) # this will show you the arguments of gsub
    names(dat) <- gsub('%', '', names(dat))

Now lets say that we want to create a variable that gives us the
distance between the start and end of each region.

    dat <- mutate(dat, dist = end - start)

Modify this code to include another variable, *non\_uniqueSNPs*, that is
`1 - uniqueSNPs / totalSNPs`.

### Filtering data

Filtering data is a way to work on a subset of the data. This makes
sense, since the description said we were working with 1Kb regions.
After looking at the data, we notice that every region is the same
length, from start to end. We can probably remove `dsit` from `dat`. Any
of the following commands will accomplish this task:

    dat <- select(dat, -dist)
    dat$dist <- NULL

What are the advantages of each command above? When might we prefer one
over the other?

We also might want to take a look at all regions that are above 0.01.
Side note: 1 centimorgan (cM) is the distance across which we would
expect 0.01 crossovers in a generation or 1 crossover in 100
generations. Thus a length of chromosome across which we would expect 1
crossover in a generation is 1 Morgan in length. The rough rule of thumb
for the relationship between the physical length of a chromosome and the
genetic length is 1 Mb per M (i.e. we generally expect 1 crossover per
Mb in humans). This varies significantly across the genome, and it
varies significantly by sex (females have nearly double the
recombination rate of males). By our rule of thumb we would expect this
value to be somewhere near 0.001 Morgans for a 1Kb region.

    # filter dat such that Recombination > 0.01
    filter(dat, Recombination > 0.01)

This would represent 3,000 of the regions with the highest recombination
rates on chromosome 20.

Now, filter the data such that the read depth is greater than 4 *and*
the recombination fraction is greater than 0.1.

### Sorting data with arrange()

Our data set is sorted by *start*. What if we want to sort it by
different columns?

    arrange(dat, totalSNPs) # sort by totalSNPs
    arrange(dat, desc(totalSNPs)) # sort by totalSNPs in descending order

Now sort dat by *totalSNPs*, and for rows with the same number of total
SNPs, sort by *Recombination* in descending order.

### Reshaping data

Sometimes we get data that is not organized in a convenient way. Take a
look at the *who* data set from the *tidyverse* package:

    str(who)

Here we have a subset of the World Health Organization Global
Tuberculosis Report for many global populations. These data aren't tidy,
because they don't have one row per observation. The *new\_sp\_m014* and
*new\_sp\_m1524* variables, for example, have two different observations
on the same row. We can use the `gather()` function to convert this wide
data into a long format as follows:

    who2 <- gather(who, group, cases, -country, -iso2, -iso3, -year)

-   `who` identifies the data set we are working on.
-   `group, cases` identifies the names of the new variables we are
    creating:
    -   `group` gets the variable name from `who`, and
    -   `cases` gets the data point.
-   `-country, -iso2, -iso3, -year` identifies the variables that don't
    need to be gathered.

There is another function, `spread()` that will take a long data set and
convert it to a wide format. It operates in a similar fashion (see
`?spread` for more details).

The pipe: `%>%`
---------------

The pipe is a construct that takes the output of one function and sends
it to another function as input. For example, lets say that we want to
take the output from one of our calls above and pipe it into
`summary()`.

    filter(dat, Recombination > 0.01) %>%
        summary()

This is a lot of information. Perhaps we are really interested in a
summary of *Divergence* for this subset of the data. Pipe the output of
`filter()` into `select()` such that we only get a summary of
*Divergence*.

Try using this technique to get an idea of how *totalBases* varies as
read depth increases. Might there be a better way of accomplishing this?

A note on large data
--------------------

You won't always be able to fit an entire data set into memory. Some
options include:

-   Run it on a machine with more memory,
-   Do the analysis in smaller pieces (e.g. one chromosome at a time),
-   Drop unnecessary data (i.e. not all columns are needed for every
    analysis),
-   Summarize the data prior to analysis (e.g. analyzing variants rather
    than full sequence data),
-   Do the analysis on a random subset of the data set.

You may also find that reading in the data (or many files containing
lots of data) goes much faster if you do some or all of the following:

-   Use `read_csv()` instead of `read.csv()`.
-   Use the `col_types` variable to tell R what to expect in
    each column. This will save R from having to guess the variable type
    of each column.
-   Read from compressed files.
-   Use Unix utilities to do some data wangling before you read it
    into R.

Exploring data
--------------

In the time we have remaining, explore the *who2* data set. Get to know
the data. What questions could we ask. How do we need to change the data
in order to ask those questions?

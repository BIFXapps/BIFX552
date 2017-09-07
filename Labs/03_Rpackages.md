Introduction
============

Tonight, we will build our own R package with three different functions
that do the same thing but are coded differently. The purpose is
two-fold:

-   First, we will to practice writing R scripts that contain loops,
    vectorized code, and direct calls to C code. These scripts will be
    bundled together into an R package.
-   Second, we will explore the benefits of these three techniques, as
    well as using existing libraries and packages.

R Packages
==========

R packages have a very specific structure, and they contain some
documentation of how to use the functions and/or data that are included
in the package. Otherwise, they are very similar to other functions you
might write. If you are interested in learning more about package
creation, check out Karl Broman's [R package
primer](http://kbroman.org/pkg_primer/) and the [R Package
Tutorial](https://cran.r-project.org/doc/contrib/Leisch-CreatingPackages.pdf)
on CRAN, which I used as references for a few sections while writing up
these notes. If you really want to get into writing R packages, I would
highly recommend Hadley Wikham's [R packages](http://r-pkgs.had.co.nz)
book. You can find a copy on Amazon for about $30, or you can view an
electronic version if you have a Frederick County Public Library card
(see their [Safari Books
Online](http://www.fcpl.org/learn/safari-books-online) page for more
details).

The R Package tutorial on CRAN starts out by defining the following
terms:

-   Package: An extension of the R base system with code, data and
    documentation in standardized format.
-   Library: A directory containing installed packages.
-   Repository: A website providing packages for installation.
-   Source: The original version of a package with human-readable text
    and code.
-   Binary: A compiled version of a package with computer-readable text
    and code, may work only on a specific platform.
-   Base packages: Part of the R source tree, maintained by R Core.
-   Recommended packages: Part of every R installation, but not
    necessarily maintained by R Core.
-   Contributed packages: All the rest. This does not mean that these
    packages are necessarily of lesser quality than the above, e.g.,
    many contributed packages on CRAN are written and maintained by R
    Core members. We simply try to keep the base distribution as lean
    as possible.

Pacakge structure
-----------------

These are the following directories you may include (those marked with
'\*' are required) in your R package.

-   data
    -   Contains RData sets included in the package.
-   DESCRIPTION\*
    -   Contains description data for the package as well as
        instructions to R CMD BUILD on how to compile the package (more
        information below).
-   inst
    -   Contains additional files that should be installed with
        the package.
-   man\*
    -   Contains man files to document your functions and data (more
        information below).
-   NAMESPACE
    -   Contains specific functions that are to be used by the end user
        (more information below).
-   R\*
    -   Contains your R code defining functions for the package.
-   src
    -   Contains any source code (e.g. in C) that is called by
        your package.
-   tests
    -   Contains testing code to be run at compile time to verify that
        things are working the way you expect them to (more
        information below).
-   vignettes
    -   Contains additional documentation for your package (more
        information below).

DESCRIPTION
-----------

The *DESCRIPTION* file needs to have the following items. There are some
additional tags you may include, but we won't go over them here.

An example *DESCRIPTION* file:

    Package: ALDsuite
    Version: 0.4.3
    Date: 2016-04-26
    Title: ALDsuite
    Author: Randall Johnson <johnsonra@mail.nih.gov>
    Maintainer: Randall Johnson <johnsonra@mail.nih.gov>
    Depends: parallel, mvtnorm, hwde, R (>= 3.0)
    Suggests: ALDdata, gdata, ncdf4
    Description: Suite of tools for inferring Admixture Linkage Disequilibrium and testing disease association hypotheses.
    License: GPL (>= 2.0)

man
---

Some minimal documentation is required for you to compile an R package.
When you have a function defined and ready to document, load it into
your R workspace and use the `prompt()` function to generate a skeleton
.Rd file. For example, if you have a function called `transpose_loop()`,
you would call `prompt(transpose_loop)`.

The .Rd file created will have the following parts (addtional parts can
be added if desired):

-   `\name{}` contains the name of the file.
-   `\alias{}` contains the name of the function documented. You can
    include multiple `\alias{}` entries to document multiple functions
    within the same file. See `?rnorm` for an example of multiple
    functions documented in the same file.
-   `\title{}` contains a title for your documentation file.
-   `\description{}` contains additional text describing the purpose of
    your documented function(s).
-   `\usage{}` contains the default function call. If including multiple
    `\alias{}` entries, you will need multiple `\usage()` entries.
-   `\arguments{}` contains a brief description of all arguments that
    can be passed to each function. Arguments shared by multiple
    functions should be the same to avoid confusion. You only need one
    entry in the `\arguments{}` section for each argument, even if it is
    inluded in multiple functions.
-   `\details{}` is a good place to add information that is too verbose
    to include in the `\arguments{}` section or that touches on multiple
    arguments and how they interact with each other.
-   `\value{}` describes the object(s) that is/are returned from
    the function(s).
-   `\examples{}` gives a few examples to give the user an idea of how
    to use the function(s).
-   `\keyword{}` is required to tell R how to classify the functions.
    See `RShowDoc("KEYWORDS")` for the available keywords. You have to
    pick at least one keyword from this list, but don't stress too much
    about your choice. My impression is that the keywords don't really
    do anything important.
-   There are several other sections you can include, or you can add
    your own sections.

NAMESPACE
---------

This contains specific functions that are to be used by the end user. If
not included, all functions are available for end users to use. Any
functions left out can be called from your package code, but will not be
recognized by R if the end user tries to call them.

For example, the function, `cum.prob.fun()` in my [ALDsuite
packge](https://github.com/johnsonra/ALDsuite) isn't really made for use
by the end user. Additionally, I have to be less careful about double
checking that the variables passed to it are what they should be if end
users can't use us. Excluding those checks makes my code run faster.

You can also include `S3_method()` to tell R about print and plot
methods (among others), and you will need to tell R what libraries to
load to make your C code work.

Writing vignettes
-----------------

Vignettes are a great way to write documentation for your package. This
provides a medium for you to share the most important parts of your
package with end users, as the R documentation located in the *man*
directory may not be the easiest for people to follow (it often gets
ignored). In fact, you can create more than one vignette to cover
different topics if you prefer.

There are several formats that you can use for your vignettes, but the
easiest is probably Rmarkdown (I often use [adam-p's markdown
cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
as a reference). Karl Broman notes that you'll put this Rmd file in your
*vignettes* directory and include the following code at the top of the
file:

    ---
    title: "Put the title of your vignette here"
    output: rmarkdown::html_vignette
    vignette: >
      %\VignetteIndexEntry{Put the title of your vignette here}
      %\VignetteEngine{knitr::rmarkdown}
      \usepackage[utf8]{inputenc}
    ---

and the following two entries in your *DESCRIPTION* file:

    Suggests: knitr, rmarkdown
    VignetteBuilder: knitr

This Rmd file will be compiled and added to your package when using
`R CMD BUILD`.

Testing R packages
------------------

There are many great tools for testing your R package. The purpose is to
include short bits of code that double check that you are getting
exactly what you expect to be getting under different circumstances.
Karl Broman recommends that whenever your come across a bug that you
should first write a short test that duplicates the bug and include it
in your package tests. If you came across this bug once, you are likely
to come across it again. We will cover this in more detail at a later
time, but check out the following sources in the mean time for more
details:

-   [Writing tests](http://kbroman.org/pkg_primer/pages/tests.html) by
    Karl Broman
-   Hadley Wikham's [testthat
    package](https://github.com/hadley/testthat)

Practice
========

Write the following functions to transpose a matrix, *x*:

-   `transpose_loop(x)`
    -   This should use a nested for loop to do the transposition
-   `transpose_vect(x)`
    -   This should use vectorized code to do the transposition. A
        single for loop is acceptible.
-   `transpose_C(x)`
    -   We will write a quick C function to do the trasposition, using
        `transpose_loop()` as a template. We will use the `inline`
        package to keep this simple.

Once you have finished your R code, create a single .Rd file for your
functions. Note that we won't be able to call `transpose_C()` from our
package, as the way we have set it up doesn't get along with R packages.
We would need to do a little additional work to put this into the
package.

Install your package and let's give it a try!

-   Using the `system.time()` function, time how long each of your three
    functions takes to execute with different sized matricies, and use
    the built-in R function, `t()`, as a baseline.

-   What does this tell us about using built-in functions and libraries?
-   What does this tell us about how much effort we should put into
    writing our code?

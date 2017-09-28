Take a look at NEISS data
-------------------------

This data set comes from the [Consumer Product Safety
Commission](https://www.cpsc.gov/Research--Statistics), and contains
data from the National Electronic Injury Surveillance System (NEISS).
For more information on codes, see the [NEISS Coding
Manual](https://www.cpsc.gov/s3fs-public/2017NEISSCodingManualCPSConlyNontrauma.pdf).
It is important to note, for example, that a child aged nine months will
have an age code of 209. You might find some of the ages suspicious if
you didn't know that.

Setup
-----

-   Link */home/johnson/data/NEISS-data-2016-updated-APRIL2017.xlsx* to
    your *~/data* directory.
-   Use the R code located at */home/johnson/scripts/06\_NEISS.R* to
    make an Rmd file that will generate a nice pdf of the analysis.
    -   Include comments and narrative describing the data and
        the analysis.
-   After we finish the base Rmd file, we will push my file up to the
    class repository located at
    <https://github.com/BIFXapps/NEISS-analysis>.
-   Everyone will fork the class repository to their own accounts and
    continue to make changes from there.
-   Clone your *forked* repository to your laptop.

Add contributions to the repository
-----------------------------------

We will start by coming up with some questions as a group that can be
answered using these data. For example, is there a difference in the
number of concussions (diagnosis 52) by age or by gender?

We will pick one question at a time to answer and do the following:

-   Expand the code in the Rmd file to include graphics and summary
    statistics to answer the question.
-   When finished push your changes up to your repository.
-   One student will issue a pull request to the class repository with
    all changes.
-   Another student will review and accept the pull request.
-   Everyone will want to sync their forked repository with the upstream
    class repository and pull the class changes down from GitHub.
    -   To set up syncing with the upstream repository, you first need
        to add a remote repository path. Open the settings for your
        repository, and under remotes click *add*. You will want to add
        <https://github.com/BIFXapps/NEISS-analysis> to your remotes.
    -   From your master branch you should now be able to merge the
        upstream repository into your master branch!

Again, git won't do anything unless you tell it to. That includes
pulling updates from an upstream repository that you have forked. You'll
typically want to pull those changes down, however, so you may want to
*watch* the upstream repository for updates.

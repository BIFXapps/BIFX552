Snakemake
---------

Snakemake is a python tool for stitching pipelines together that is very
similar to Make. We will be developing our own small pipeline to run a
simple microbiome analysis following the [Schloss lab
SOP](https://www.mothur.org/wiki/454_SOP).

I've included all the data we'll need in my `~/data/` directory. Create
your own subdirectory for this week's lab and copy my Snakefile from
`~/lab14/Snakefile`.

Snakefile
---------

The first line of our Snakefile defines the directory where our source
data live, and the second line initializes our sample IDs. We can use
the `{sample}` wildcard throughout the script, and each rule will repeat
for every sample ID.

    DATA = "~/data/"
    FILES, = glob_wildcards(DATA + "{sample}.shhh.fasta")

The *all* rule tells Snakemake what we want to end up with. In this
case, we want a bunch of fasta files (one for each sample ID) in our
current working directory.

    rule all:
        input: expand("./{sample}.fasta", sample = FILES)

We will use the *link\_files* rule to link all of our source data files
to the current working directory. At one point, Mothur required all
reference data to be in the current working directory as well. We'll
make that assumption and link any additional reference data files to
this directory using this rule.

    rule link_data:
        input:
            fi = DATA + "{sample}.shhh.fasta",
            ni = DATA + "{sample}.shhh.names"
        output:
            fo = "./{sample}.fasta",
            no = "./{sample}.names"
        shell:
            "ln -s {input.fi} {output.fo};"
            "ln -s {input.ni} {output.no}"

When we put this file in our current working directory and run the
`snakemake` command line from the terminal, Snakemake goes through the
following steps:

-   Initialize the *DATA* and *FILES* variables.
-   Check the *all* rule. This rule requires the following files:
    'GQY1XT001.MOCK.GQY1XT001.shhh.fasta',
    'GQY1XT001.F003D148.shhh.fasta', ...
    -   Find the rule that generates these files (i.e. in the
        `output` statement).
    -   Check the *link\_data* rule. This rule requires only files
        derived from the *FILES* variable, so we can run this rule.
        -   Run the `shell` portion of this rule for every sample ID in
            `{sample}`.
-   Go back to the *all* rule. We should have all inputs for this rule,
    and it doesn't do anything.
-   Done.

454 SOP
-------

This Snakefile doesn't do a whole lot right now, but we are skipping
several hours of computing done in the first three commands of the SOP
(read this [Snakemake
tutorial](http://snakemake.readthedocs.io/en/stable/tutorial/tutorial.html)
for more information and options). The rest we should be able to run in
class. If we were to build on this to make a full pipeline, we would
want to start the pipeline at the first step with `sffinfo()`.

We will start at the paragraph that reads: "The two important files from
running shhh.flows are the shhh.fasta and shhh.names." Add more rules
until we have a general pipeline set up for this SOP.

Hint: before running `snakemake`, try looking at the output of
`snakemake -np` to check that it is going to do what you think it is
going to do.

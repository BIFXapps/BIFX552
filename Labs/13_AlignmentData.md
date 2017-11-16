Introduction
------------

Buffalo mentions using the `wgsim` utility to simulate sequence reads
from the *C. elegans* genome. We will follow his analysis and make our
own simulated sequence reads from chromosome 22 of the human genome.
I've downloaded and unzipped the fasta file into my data directory as
follows:

    curl -O http://hgdownload.cse.ucsc.edu/goldenPath/hg38/chromosomes/chr22.fa.gz
    gunzip chr22.fa.gz

1.  Generate your own fasta file from chromosome 22 that only contains
    the range \[36253071, 36267531\], which covers the APOL1 gene.
    (hint: you may find page 353 of Buffalo helpful.)

Generating simulated reads
--------------------------

There are a lot of bioinformatics tools that you will use, many of which
haven't been created yet, and the quality of the documentation for these
tools varies significantly. Before we use `wgsim`, we will want to
figure out how to use it.

If you Google `wgsim`, you'll probably come across [Heng Li's GitHub
site](https://github.com/lh3/wgsim), but you may also find this
[SAMtools primer](http://biobits.org/samtools_primer.html) helpful (see
the *Generating Simulated Reads* section). We can also refer to
[Buffalo's
Makefile](https://github.com/BIFXapps/bds-files/blob/master/chapter-11-alignment/celegans-reads/Makefile)
documenting his simulated sequence from *C. elegans*. You can also see a
summary of possible options by entering the `wgsim` command into your
terminal window with no arguments.

1.  Generate simulated paired end sequence from your fasta sequence of
    the APOL1 gene. The target length of our sequence should be 100 bp,
    and our desired base error rate is 0.01.

The columns from the standard output from `wgsim` (e.g. not what is
written to the \_\*.fq\_ files) are:

1.  Chromosome range of the sequence
2.  Position in the sequence
3.  Original base
4.  New base (using [IUPAC
    codes](https://www.bioinformatics.org/sms/iupac.html))
5.  Zygosity (+ = heterozygous, - = homozygous)

For example, the second simulated variant is at position 1022 of the
sequence. The individual is heterozygous for G/C at that location.

Further steps
-------------

-   Use `bwa mem` to align your reads back to your fasta sequence (see
    [Buffalo's
    Makefile](https://github.com/BIFXapps/bds-files/blob/master/chapter-11-alignment/celegans-reads/Makefile)
    and the [bwa man page](http://bio-bwa.sourceforge.net/bwa.shtml)
    for clues).

-   Convert your *sam* file into *bam* format using `samtools view`.

-   Use GATK's [haplotype
    caller](https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php)
    to generate a VCF file. There are [more
    steps](https://software.broadinstitute.org/gatk/best-practices/bp_3step.php?case=GermShortWGS)
    that we would normally follow here, but we'll be skipping them for
    this example. I've put the *GenomeAnalysisTK.jar* file in my
    `~/bin` directory.

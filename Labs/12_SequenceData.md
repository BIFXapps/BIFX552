Sequence Data
-------------

We will be working with two files downloaded from the 1000 Genomes
project downloaded on the server with the following commands:

    curl -O ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00102/sequence_read/SRR077485_1.filt.fastq.gz
    curl -O ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00102/sequence_read/SRR077485_2.filt.fastq.gz

We don't want 5 copies of this on the server, so create a new directory
for this week's lab (I put mine at `~/lab12`) with symbolic links to
these files.

Once you've done that, answer these questions:

-   How big are the two files?

-   How many reads are in each file?

-   What is the read length?

Take a subset of these FASTQ files for the remainder of the lab using
`seqtk sample`. You can modify this command (pick your own seed, but use
the same seed for both commands):

    seqtk sample -s376 SRR077485_1.filt.fastq.gz 10000 > sub1.fq
    seqtk sample -s376 SRR077485_2.filt.fastq.gz 10000 > sub2.fq

-   What is the distribution of quality scores?

fastqc
------

The [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
program is a handy way to quickly generate nice figures showing the
distribution of quality scores as well as run quality control checks on
several other aspects of the reads. I ran the entire
*SRR077485\_1.filt.fastq.gz* file through `fastqc`, and the results can
be explored
[here](https://bifxapps.github.io/BIFX552/SRR077485_1.filt_fastqc/fastqc_report.html).
The output is organized into the following areas:

-   Basic statistics: A brief overview of the entire report.
-   Per base sequence quality: A summary of the quality scores similar
    to what we generated above.
-   Per tile sequence quality: This will highlight any flow cells that
    have a high proportion of low quality reads.
-   Per sequence quality scores: A summary of the distribution of mean
    quality scores for each sequence.
-   Per base sequence content: Sequence content (proportion of As, Cs,
    Gs and Ts) at each position in the reads.
-   Per sequence GC content: Distribution of GC content over
    all sequences.
-   Per base N content: Proportion of missing bases at each position.
-   Sequence length distribution: Shows distribution of read length.
    Some platforms you would expect to have one sequence length, while
    others should have significant variability.
-   Duplicate sequences: Summary of proportion of duplicated sequences.
    The x-axis shows the number of duplicated sequences, and the y-axis
    show the proportion of sequences at that level. For example, the
    proportion of our sequences that are duplicated 3 times is 3.5%.
-   Over represented sequences: This will give you a summary of specific
    sequences that make up more than 0.1% of the total sample.
-   Adapter content: This will highlight common read-through adapters
    that may be showing up on the end of your sequences.
-   Kmer content: This will show you any over represented kmers in
    your data. This is similar to the duplicate sequences summary, but
    looks only at portions of the sequence.

Run `fastqc` on your sample of reads and look over the results. This is
the command I used to generate the results linked above:

    fastqc SRR077485_1.filt.fastq.gz

Bonus challenge problem
-----------------------

Download a FASTQ file and analyze the quality scores. Write a short
summary (1-2 paragraphs) of the quality indicators.

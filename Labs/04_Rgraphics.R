# Week 4 Graphics Lab
# This code will help you get started
# You can follow along with the slides found at

library(tidyverse) # for pretty much everything else

# nice colorblind pallete found at http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# colorbrewer2.org also has some nice color palletes
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# I prefer this theme to the standard ggplot2 theme
# it is cleaner and uses less ink (not that I am opposed to using ink, but it can distract)
theme_set(theme_classic() +
              theme(axis.line.x = element_line(color = 'black'),
                    axis.line.y = element_line(color = 'black'),
                    panel.background = element_rect(fill = 'transparent'),
                    plot.background = element_rect(color = 'transparent'),
                    strip.background = element_rect(fill = 'transparent'),
                    rect = element_rect(fill = 'transparent'),
                    text = element_text(size = 20)))


#################
# Scatter Plots #
#################

set.seed(289347)
dat <- data_frame(x = rnorm(100, mean = 23, sd = 5),
                  y = x + rnorm(100, sd = 3))

# create a scatter plot, save it to g, and plot the figure in the graphics window
(g <- ggplot(dat, aes(x = x, y = y)) +
      geom_point())
# note the (), this is the same as the following:
g <- ggplot(dat, aes(x = x, y = y)) +
     geom_point()
g

# add a linear trend line with standard error
g + geom_smooth(method = 'lm')

# add grid lines back into the figure. I doubt anyone would ever want this combination of colors, though
g + theme(panel.grid.major = element_line(color = 'grey75'),
          panel.grid.minor = element_line(color = 'hotpink'))

# Rug plot
g + geom_rug()

########################
# Box and Violin Plots #
########################

n <- 500 # individuals per group

set.seed(239847)
bxplt <- data_frame(group = as.factor(rep(1:3, each = n)),
                    value = c(rnorm(n, 5, 2),
                              rnorm(n/2, 8, 2), rnorm(n/2, 1, 2),
                              rchisq(n, 2)))

# base figure
g <- ggplot(bxplt, aes(x = group, y = value))

# add boxplot layer
g + geom_boxplot()

# add jittered points layer
g + geom_jitter(width = 0.2, alpha = 0.4)
# this is what it would look like without geom_jitter
g + geom_point()

# add violin plot layer with boxplot layer over the top
# this would be my preference
g + geom_violin() + geom_boxplot(width = 0.07)

# some of my colleagues prefer this picture, but I find it a little busy
g + geom_violin() +
    geom_jitter(width = 0.2, alpha = 0.1) +
    geom_boxplot(width = 0.07, alpha = 0.7)


###################
# Transformations #
###################

n <- 500 # number of data points

# generate continuous data set to work with
set.seed(234789)
trans_cont <- data_frame(x = rnorm(n),
                         y = 10^(x + rnorm(100)))

# base figure
g <- ggplot(trans_cont, aes(x = x, y = y)) +
     geom_point()

# add smoothed line without standard error (untransformed)
g + geom_smooth(se = FALSE)

# this transormation looks much nicer - trenline clearly looks log-linear (transformed)
g + geom_smooth(method = 'lm') +
    scale_y_log10()

# generate categorical data set to work with
trans_cat <- data_frame(OR = c(0.4, 1.2, 1.7, 0.9),
                        lOR = log(OR),
                        se = rep(.2, 4),
                        lower = exp(lOR - 1.96*se),
                        upper = exp(lOR + 1.96*se),
                        group = c('A', 'A', 'B', 'B'),
                        treat = c('Treatment', 'Placebo', 'Treatment', 'Placebo'))

#### base figure
pos <- position_dodge(width = 0.2) # this moves the group A/B CI's slightly appart

(g <- ggplot(trans_cat, aes(treat, OR, color = group)) +
        geom_point(position = pos, size = 2) + # plot OR's
        geom_errorbar(aes(ymin = lower, ymax = upper), position = pos, width = 0.2, size = 0.7) + # add error bars
        geom_hline(yintercept = 1, linetype = 2) + # add dashed line at OR = 1
        theme(axis.title.x = element_blank(), # remove the x axis title, "treat"
              axis.line.x = element_blank(), # remove the axis line across the bottom of the figure
              axis.ticks.x = element_blank()) + # remove the tick marks at Placebo and Treatment on x axis
        scale_color_manual(values = cbbPalette)) # color the lines black and gold instead of the default colors

# this puts ORs on both sides of 1 on an equal scale -- much easier to see what is going on
# ggplot's default is to display the untransformed numbers on the y-axis.
# That might be good for some people, but others will be confused and want to see the log OR
# we include both here
g + scale_y_continuous(trans = 'log', breaks = c(0.3, 0.5, 1, 2), # rescale with breaks at 0.3, 0.5, ...
                       sec.axis = sec_axis(trans = ~ log(.), name = 'log OR')) + # add axis on the right showing log OR scale
    guides(color = FALSE) # remove group A/B labels on the right panel to make room for the axis


############################
# For exploration of color #
############################

set.seed(29384)
dat <- data_frame(x = rnorm(300),
                  y = c(rnorm(200),
                        x[201:300] + rnorm(100, sd = .5)),
                  g = factor(rep(c(1,1,2), each = 100)))

# nice scatter plot
ggplot(dat, aes(x, y)) +
    geom_point()

# color reveals strong trend in subset of dat, but these colors are bad
g <- ggplot(dat, aes(x, y, color = g)) +
    geom_point() +
    guides(color = FALSE) # don't really care about the group labels in the right panel for this example
g + scale_color_manual(values = c('green3', 'red'))

# the default ggplot2 colors are also not colorblind friendly
# check out how this looks using ColorOracle or some other similar tool
g

# nice colorblind pallete found at http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# colorbrewer2.org also has some nice color palletes
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

g + scale_color_manual(values = cbbPalette)

# try other color combinations if you are interested
g + scale_color_manual(values = cbbPalette[c(1,3)])

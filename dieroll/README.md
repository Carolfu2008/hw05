# hw05
Overview

"dieroll" is a minimal R package that provides functions to simulate tossing a die.

die() creates a die object (of class "die")
roll() rolls a die object, producing a "die" object.
plot() method for a "die" object to plot frequencies of sides.
summary() method for a "roll" object.

# Motivation

This package has been developed to illustrate some of the concepts behind the creation of an R package.

# Installation

Install the development version from GitHub via the package "devtools":

# development version from GitHub:
#install.packages("devtools") 

# install "dieroll" (without vignettes)
devtools::install_github("Carolfu2008/hw05/dieroll")

# install "dieroll" (with vignettes)
devtools::install_github("Carolfu2008/hw05/dieroll", build_vignettes = TRUE)
Usage

library(dieroll)

# default die
die1 <- die()
die1

# 1 roll of die1
roll(die1)

# 10 rolls of die1
roll10 <- roll(die1, times = 10)
roll10

# summary
summary(roll10)


# 100 rolls
roll100 <- roll(die1, times = 100)

# summary
summary(roll100)

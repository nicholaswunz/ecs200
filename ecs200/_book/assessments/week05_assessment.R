# =============================================================================
# ECS200 Week 5 assessment - Statistical inference
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week05_YOURNAME.R and submit it before the end of class.
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(performance)
library(see)

# setwd("YOUR-WORKSHOP-FOLDER")


## Question 1: Invasive plants and native species (t-test) ## -----------------

# Hypothesis: native plant species richness differs between invaded and
# uninvaded areas.
#
# Variables in invaded.csv:
#   Native_count = number of native plant species in a 1 m2 quadrat (response, y)
#   Group        = "Invaded" or "Uninvaded" area (predictor, x, 2 groups)
# Each row is one quadrat.

# Load the data
invaded <- readr::read_csv("data/invaded.csv")

# 1a. Name the response and predictor, and what one row represents.
#     Then write the null and alternative hypotheses (as comments).
# Response:
# Predictor:
# One row is:
# H0:
# H1:


# 1b. Convert Group to a factor. Visualise Native_count for each Group
#     (boxplot + raw points) and calculate the mean, SD and n of each group.



# 1c. Check the assumptions (independence, normality, equal variances).
#     For each assumption, say whether it is met and why.



# 1d. Run a Welch's t-test (Native_count ~ Group) and write a results sentence
#     (direction, size of the difference, t, df, p-value).



## Question 2: Plant species richness and altitude (one-way ANOVA) ## ---------

# Hypothesis: plant species richness differs among altitudes.
#
# Variables in altitude.csv:
#   Richness = number of plant species in a plot (response, y)
#   Altitude = "Low", "Mid" or "High" altitude band (predictor, x, 3 groups)
# Each row is one plot.

altitude <- readr::read_csv("data/altitude.csv")

# 2a. Name the response and predictor, and what one row represents.
#     Then write the null and alternative hypotheses (as comments).
# Response:
# Predictor:
# One row is:
# H0:
# H1:


# 2b. Convert Altitude to a factor in the order Low, Mid, High.



# 2c. Visualise Richness for each Altitude and calculate descriptive statistics.



# 2d. Fit a one-way ANOVA (Richness ~ Altitude) and check its assumptions.
#     Are they met?



# 2e. Run Tukey's HSD. Which altitudes differ from each other?
#     Write a results sentence.

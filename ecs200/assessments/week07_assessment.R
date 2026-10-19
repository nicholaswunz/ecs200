# =============================================================================
# ECS200 Week 7 assessment - Linear and multiple regression
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week07_YOURNAME.R and submit it before the end of class.
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(performance)
library(see)
library(ggeffects)

# setwd("YOUR-WORKSHOP-FOLDER")


## Question 1: Island size and herbivore species richness ## ------------------

island <- readr::read_csv("data/island.csv")

# 1a. Plot raw species richness against log island area, then log species
#     richness against log island area. Which looks more linear?



# 1b. Fit a linear model using the log-log version and check its assumptions.
#     For each assumption, say whether it is met.



# 1c. Report the slope and its 95% CI, the R-squared and the p-value.
#     Write a results sentence.



# 1d. Plot the data with the fitted line and its 95% confidence interval.



## Question 2: Fairy-wren foraging height ## ----------------------------------

foraging_shrub <- readr::read_csv("data/foraging_shrub.csv")

# 2a. Visualise the relationship between foraging height and each predictor
#     (mean_shrub_size, sex_mf, substrate).



# 2b. Fit a multiple regression with shrub size, sex and substrate as
#     predictors (no interactions). Check the assumptions, including
#     collinearity.



# 2c. In words, what do the coefficients for mean_shrub_size and sex_mfMale
#     tell you?



# 2d. Plot predicted foraging height against shrub size using
#     ggeffects::predict_response().



# 2e. EXTRA (not marked): add an interaction between sex and substrate.
#     Does it improve the model? What does it mean biologically?



# =============================================================================
# ECS200 Week 8 assessment - GLMs for count data
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week08_YOURNAME.R and submit it before the end of class.
# =============================================================================
# Pollinator visits in urban gardens and bushland
# 80 plants of one native shrub species were each watched for 15 minutes
# (40 in urban gardens, 40 in bushland remnants). Columns:
#   plant_id - plant identity
#   habitat  - urban_garden or bushland
#   flowers  - number of open flowers on the plant
#   visits   - number of pollinator visits in 15 minutes
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(performance)
library(see)
library(ggeffects)

# setwd("YOUR-WORKSHOP-FOLDER")


## Q1. Import and check the data ## ------------------------------------------
# Import the data, check its structure, convert habitat to a factor with
# urban_garden as the reference level, and check for missing values.



## Q2. Visualise ## -----------------------------------------------------------
# Plot the distribution of visits, and plot visits against flowers coloured by
# habitat. Describe what you see.



## Q3. Poisson GLM ## ---------------------------------------------------------
# Fit a Poisson GLM with flowers and habitat as predictors. Check it for
# overdispersion. Is the Poisson model appropriate? Explain.



## Q4. A more appropriate model ## --------------------------------------------
# Fit a more appropriate model and check its assumptions with check_model(),
# and compare the observed number of zeros with the number the model expects.



## Q5. Rate ratios ## ---------------------------------------------------------
# Calculate the rate ratios and their 95% CIs. In words, how much does the
# number of visits change (a) for every extra open flower, and (b) in bushland
# compared with urban gardens?



## Q6. Plot the predictions ## ------------------------------------------------
# Plot predicted visits against flowers for each habitat using
# ggeffects::predict_response().



## Q7. Results sentence ## ----------------------------------------------------



## Q8. Zeros ## ---------------------------------------------------------------
# Some plants received no visits. Give one reason why a zero might be a TRUE
# zero and one reason it might be a FALSE zero in this study, and suggest a
# change to the design that would reduce false zeros.



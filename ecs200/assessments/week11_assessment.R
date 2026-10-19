# =============================================================================
# ECS200 Week 11 assessment - GLMs for binary data (logistic regression)
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week11_YOURNAME.R and submit it before the end of class.
# =============================================================================
# Coral bleaching after a marine heatwave
# 150 tagged coral colonies were checked after a marine heatwave. Columns:
#   colony_id - colony identity
#   dhw       - degree heating weeks at the colony (heat stress)
#   depth_m   - depth of the colony (m)
#   bleached  - 1 = bleached, 0 = not bleached
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(performance)
library(see)
library(ggeffects)

# setwd("YOUR-WORKSHOP-FOLDER")


## Q1. Import and check the data ## ------------------------------------------
# How many colonies bleached?



## Q2. Visualise ## -----------------------------------------------------------
# Plot bleaching against DHW and against depth. Describe the patterns.



## Q3. Fit the model ## -------------------------------------------------------
# Logistic regression with dhw and depth_m as predictors.



## Q4. Check the model ## -----------------------------------------------------
# Binned residuals and collinearity. Is the model appropriate?



## Q5. Odds ratios ## ---------------------------------------------------------
# Odds ratios and 95% CIs. In words, how do the odds of bleaching change with
# each extra DHW and with each extra metre of depth?



## Q6. Predicted probabilities ## ---------------------------------------------
# Predicted probability of bleaching for a colony at 5 m depth at 4 DHW and
# at 8 DHW. Plot predicted probability against DHW.



## Q7. Results sentence ## ----------------------------------------------------



## Q8. Study design ## --------------------------------------------------------
# Give one reason why a colony recorded as "not bleached" might be
# misclassified, and how the design could be improved.



# =============================================================================
# ECS200 Week 12 assessment - Mixed-effects models
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week12_YOURNAME.R and submit it before the end of class.
# =============================================================================
# Seagrass shoot length and water depth
# Divers sampled 8 seagrass meadows. In each meadow, 12 quadrats were placed at
# different depths. Columns:
#   meadow          - meadow identity (M1 to M8)
#   quadrat         - quadrat number within the meadow
#   depth_m         - water depth at the quadrat (m)
#   shoot_length_cm - mean seagrass shoot length in the quadrat (cm)
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(lme4)
library(lmerTest)
library(performance)
library(see)
library(ggeffects)

# setwd("YOUR-WORKSHOP-FOLDER")


## Q1. Import and check ## ----------------------------------------------------
# Which variable is the grouping (random) effect, and why should it be random
# rather than ignored?



## Q2. Visualise ## -----------------------------------------------------------
# Plot shoot length against depth with a different colour (or line) for each
# meadow. Describe the pattern within meadows and among meadows.



## Q3. Fit the two models ## --------------------------------------------------
# (a) a linear model that ignores meadow, (b) a mixed model with a random
# intercept for meadow.



## Q4. Check the mixed model ## -----------------------------------------------



## Q5. The depth effect ## ----------------------------------------------------
# Report the estimate, 95% CI and p-value from the mixed model. How do the
# estimate and its standard error differ from the lm()?



## Q6. Variance components ## -------------------------------------------------
# Report the among-meadow SD, the residual SD and the ICC. What do they tell you?



## Q7. Plot the predictions ## ------------------------------------------------



## Q8. Results sentence ## ----------------------------------------------------



## Q9. Study design ## --------------------------------------------------------
# About 100 quadrats can be afforded next year. Would you recommend
# 5 meadows x 20 quadrats or 20 meadows x 5 quadrats, if the aim is to make
# conclusions about seagrass meadows in general? Explain.



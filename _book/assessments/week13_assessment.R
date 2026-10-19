# =============================================================================
# ECS200 Week 13 assessment - Survival analysis
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week13_YOURNAME.R and submit it before the end of class.
# =============================================================================
# Are city ants more heat tolerant?
# Worker ants from rural and urban colonies were held at 42 C and the time
# until knockdown was recorded. Trials stopped at 60 minutes. Columns:
#   ant_id        - ant identity
#   origin        - rural or urban
#   head_width    - head width (mm), an index of body size
#   knockdown_min - minutes until knockdown, or 60 if still standing
#   status        - 1 = knocked down, 0 = still standing at 60 min (censored)
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(survival)
library(ggsurvfit)

# setwd("YOUR-WORKSHOP-FOLDER")


## Q1. Import and check ## ----------------------------------------------------
# How many ants from each origin were knocked down, and how many were censored?



## Q2. Why not a t-test? ## ---------------------------------------------------
# Explain in one or two sentences.



## Q3. Kaplan-Meier curves ## -------------------------------------------------
# Plot the proportion of ants still standing over time for each origin, and
# report the median knockdown time for each origin.



## Q4. Log-rank test ## -------------------------------------------------------



## Q5. Cox model ## -----------------------------------------------------------
# origin and head_width as predictors. Check the proportional hazards
# assumption.



## Q6. Hazard ratios ## -------------------------------------------------------
# Report and interpret the hazard ratios for origin and head width.
# (Here the event is being knocked down: what does a hazard ratio below 1 mean?)



## Q7. Results sentence ## ----------------------------------------------------



# =============================================================================
# ECS200 Week 1 assessment - Data quality check
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week01_YOURNAME.R and submit it before the end of class.
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(visdat)

# setwd("YOUR-WORKSHOP-FOLDER")

# Import the data
plant_task_data_raw <- readr::read_csv("data/plant_calcium_task.csv")


## Initial check ## -----------------------------------------------------------
# Check the structure and summary of the data.



## Q1. Missing values ## ------------------------------------------------------
# Which numeric column has missing values, and how many?
# Do you need to remove these rows? Explain why or why not.



## Q2. Inconsistent label ## --------------------------------------------------
# Which categorical variable has an inconsistent label? Correct it.
# (Say whether you fixed it in Excel or in R.)



## Q3. Extreme values ## ------------------------------------------------------
# Find the extreme value in each of the two numeric columns.
# Which one is a data entry mistake? Remove it.



## Q4. Convert to factors ## --------------------------------------------------
# Convert watershed and transect to factors. Call the final, clean data
# plant_task_data_clean.



## Q5. Density plot ## --------------------------------------------------------
# Plot the distribution of stem_dry_mass in the clean data as a density plot.



## Q6. Interpretation ## ------------------------------------------------------
# In 2-3 sentences, explain how you decided which extreme value was an error,
# and why it matters to remove it before analysing the data.



## Q7. Save the clean data ## -------------------------------------------------

# readr::write_csv(plant_task_data_clean, "data/plant_task_data_clean.csv")


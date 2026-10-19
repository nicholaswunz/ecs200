# =============================================================================
# ECS200 Week 2 assessment - Tidy data
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week02_YOURNAME.R and submit it before the end of class.
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)

# setwd("YOUR-WORKSHOP-FOLDER")

# Import the clean data you saved in Week 1
plant_task_data_clean <- readr::read_csv("data/plant_task_data_clean.csv")


## Q1. Select columns ## ------------------------------------------------------
# Keep only year, watershed, elevation, stem_length, leaf_dry_mass and
# stem_dry_mass.



## Q2. New column ## ----------------------------------------------------------
# Create total_mass_mg: total dry mass (leaf + stem) in milligrams.



## Q3. Summary table ## -------------------------------------------------------
# Mean, SD and sample size of total_mass_mg for each watershed and year.



## Q4. Reshape ## -------------------------------------------------------------
# Use tidyr::pivot_wider() to make a table of the means with one row per
# watershed and one column per year.



## Q5. Interpretation ## ------------------------------------------------------
# Did seedlings in the calcium-treated watershed (W1) have a higher mean total
# mass than Reference seedlings in both years? By roughly how much?



## Q6. Save this script ## ----------------------------------------------------
# Continue in Week 3 under the header "Week 3 workshop - Descriptive statistics".


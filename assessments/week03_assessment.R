# =============================================================================
# ECS200 Week 3 assessment - Descriptive statistics and figures
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week03_YOURNAME.R and submit it before the end of class.
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(patchwork)

# setwd("YOUR-WORKSHOP-FOLDER")

# Clean data from Weeks 1 and 2, with total dry mass in milligrams.
# (Use your own Week 2 code here if you prefer.)
plant_data <- readr::read_csv("data/plant_calcium_task.csv") %>%
  dplyr::mutate(watershed     = dplyr::if_else(watershed == "W2", "W1", watershed),
                watershed     = factor(watershed),
                total_mass_mg = (leaf_dry_mass + stem_dry_mass) * 1000) %>%
  dplyr::filter(stem_dry_mass < 1)


## Q1. Distribution ## --------------------------------------------------------
# Plot the distribution of total_mass_mg. Is it symmetrical or skewed?



## Q2. Summary statistics ## --------------------------------------------------
# Choose suitable measures of centre and spread (explain why), and calculate
# them with the sample size for each watershed and year.



## Q3. W1 seedlings in 2003 vs 2004 ## -----------------------------------------
# What are the centre, spread and n for W1 in 2003? Are they similar in 2004?



## Q4. Publication-ready figure ## --------------------------------------------
# Raw data plus your chosen centre and spread, for each watershed and year.
# Use colour, label axes with units, and use facet_wrap() for year.



## Q5. Interpretation ## ------------------------------------------------------
# In one or two sentences, what does the figure show about the effect of
# calcium on seedling mass?



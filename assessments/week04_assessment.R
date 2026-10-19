# =============================================================================
# ECS200 Week 4 assessment - Diversity indices
# Name:
# Student number:
# Date:
# =============================================================================
# Instructions
# - Answer every question below. Write your code under each question.
# - Add a short # comment to EVERY piece of code saying what it does and why.
# - Write written answers as # comments directly under the code that produced them.
# - Save this file as week04_YOURNAME.R and submit it before the end of class.
# =============================================================================
# Does drought change soil invertebrate communities?
# Pitfall-trap catches from control and drought (rain-out shelter) plots in
# 5 blocks. Columns: sample_ID, month, block, shelter, treatment, trap, then
# one column per invertebrate order (counts), then "unidentified".
# =============================================================================


## Set up ## ------------------------------------------------------------------

library(tidyverse)
library(vegan)

# setwd("YOUR-WORKSHOP-FOLDER")


## Q1. Import and quality check ## --------------------------------------------
# Structure, missing values and duplicated rows.



## Q2. Long format ## ---------------------------------------------------------
# One row per sample and order, leaving out the "unidentified" column.
# Why should unidentified individuals not be counted as a separate group when
# calculating richness?



## Q3. Relative abundance ## --------------------------------------------------
# Relative abundance of each order in each treatment, and a plot.
# Which order dominates both treatments?



## Q4. Richness ## ------------------------------------------------------------
# Number of orders with at least one individual in each treatment.



## Q5. Shannon diversity ## ---------------------------------------------------
# Shannon index for each treatment, and a plot.



## Q6. Interpretation ## ------------------------------------------------------
# In 2-3 sentences, how did drought affect the invertebrate community?



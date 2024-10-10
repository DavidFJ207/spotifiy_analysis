#### Preamble ####
# Purpose: Cleans the raw plane data recorded
# Author: Gadiel David Flores
# Date: 19 September, 2024
# Contact: davidgadiel.flores@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(testthat)

# Load the data
data <- read_csv("data/analysis_data/analysis_data.csv")

#### Test 1: Check for empty (NA) data ####
test_that("Data contains no missing values", {
  expect_true(all(!is.na(data)))
})

#### Test 2: Check that all numeric data is positive ####
test_that("All numeric columns have positive values", {
  numeric_columns <- data %>%
    select_if(is.numeric)  # Select only numeric columns
  
  # Check that all values in numeric columns are positive
  expect_true(all(numeric_columns >= 0, na.rm = TRUE))
})
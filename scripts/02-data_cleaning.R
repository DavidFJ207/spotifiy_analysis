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

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(civic_centre, marriage_licenses, time_period) |>
  
  mutate(time_period = lubridate::ym(time_period)) |>
  
  mutate(marriage_licenses = as.numeric(marriage_licenses)) |>
  
  # Clean missing values
  tidyr::drop_na() |>
  
  # Rename columns for consistency or clarity
  rename(
    civic_centre = civic_centre,
    licenses_issued = marriage_licenses,
    date = time_period
  )

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

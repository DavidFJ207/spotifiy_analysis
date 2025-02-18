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
### Helper Functions ####
# calculate the mean of a column
calculate_column_mean <- function(data, column_name) {
  # Extract the specified column as a vector
  column_data <- data %>%
    pull({{ column_name }})  # Use curly-curly to handle non-standard evaluation of the column name
  # Remove the first value from the column vector
  column_data <- column_data[-1]
  
  # Calculate the mean of the remaining values, ignoring NA
  column_mean <- mean(column_data, na.rm = TRUE)
  
  # Return the result
  return(column_mean)
}
#### Clean data ####
raw_data_coldplay <- read_csv("data/raw_data/raw_data_coldplay.csv")
raw_data_radiohead <- read_csv("data/raw_data/raw_data_radiohead.csv")
raw_data_national <- read_csv("data/raw_data/raw_data_the_national.csv")

# Coldplay's means
coldplay_dance_mean <- calculate_column_mean(raw_data_coldplay, danceability)
coldplay_energy_mean <- calculate_column_mean(raw_data_coldplay, energy)
coldplay_loudness_mean <- calculate_column_mean(raw_data_coldplay, loudness)

# Radiohead's means
radiohead_dance_mean <- calculate_column_mean(raw_data_radiohead, danceability)
radiohead_energy_mean <- calculate_column_mean(raw_data_radiohead, energy)
radiohead_loudness_mean <- calculate_column_mean(raw_data_radiohead, loudness)

# The National's means
national_dance_mean <- calculate_column_mean(raw_data_national, danceability)
national_energy_mean <- calculate_column_mean(raw_data_national, energy)
national_loudness_mean <- calculate_column_mean(raw_data_national, loudness)


music_data <- data.frame(
  Band = c("Coldplay", "Radiohead", "The National"),
  Danceability = c(coldplay_dance_mean, radiohead_dance_mean, national_dance_mean),
  Energy = c(coldplay_energy_mean, radiohead_energy_mean, national_energy_mean),
  Loudness = c(coldplay_loudness_mean, radiohead_loudness_mean, national_loudness_mean)
)
#### Save data ####
write_csv(music_data, here::here("data/analysis_data/music_data.csv"))


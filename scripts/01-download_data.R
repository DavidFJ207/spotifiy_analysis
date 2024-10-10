#### Preamble ####
# Purpose: Downloads and saves the data from Spotify database
# Author: Gadiel David Flores
# Date: 19 September, 2024
# Contact: davidgadiel.flores@mail.utoronto.ca
# License: MIT
# Pre-requisites: Spotify API credentials stored in .Renviron file

#### Workspace setup ####
library(spotifyr)
library(tidyverse)

# Authenticate using Spotify API credentials stored in .Renviron
Sys.getenv("SPOTIFY_CLIENT_ID")
Sys.getenv("SPOTIFY_CLIENT_SECRET")

#### Download data ####

# Download data
radiohead_data <- get_artist_audio_features('radiohead')
the_national_data <- get_artist_audio_features('the national')
coldplay_data <- get_artist_audio_features('coldplay')

# Ensure 'track_preview_url' exists and rename it to 'preview_link'
if ("track_preview_url" %in% colnames(radiohead_data)) {
  radiohead_data <- dplyr::rename(radiohead_data, preview_link = track_preview_url)
}
if ("track_preview_url" %in% colnames(the_national_data)) {
  the_national_data <- dplyr::rename(the_national_data, preview_link = track_preview_url)
}
if ("track_preview_url" %in% colnames(coldplay_data)) {
  coldplay_data <- dplyr::rename(coldplay_data, preview_link = track_preview_url)
}

#### Save data ####

# Save the data
write_csv(radiohead_data, "data/raw_data/raw_data_radiohead.csv")
write_csv(the_national_data, "data/raw_data/raw_data_the_national.csv")
write_csv(coldplay_data, "data/raw_data/raw_data_coldplay.csv")


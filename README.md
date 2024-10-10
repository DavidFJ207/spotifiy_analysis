# Spotify Data Analysis Project

## Purpose
This paper provides an analysis of music using the Spotify API. In this analysis, we examine three singers: Coldplay, Radiohead and The National. By utilizing Spotify’s extensive database of music and the Spotify API, we analysis three key audio features: Energy, danceability and loudness, which provide quantitative insights into the musical characteristics of each band.

## Description
This repository contains R scripts used to download audio feature data from Spotify for the following artists:
**Coldplay**,**Radiohead**,**The National**

The data includes various audio features such as track name, duration, energy, danceability, and loudness.

## Files and Directories
- `data/raw_data/raw_data_coldplay.csv`: Contains the audio features for Coldplay tracks.
- `R/spotify_data_download.R`: The R script used to download the data from the Spotify API, rename columns, and save them as CSV files.
- `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to download, clean, and test data.
  
## Statement on LLM usage

ChatGPT4o (4o-mini) was used as an LLM for this project. Debugging, formatting, and commenting were done using LLM. All chat history for the LLM usage can be found in the `inputs/llm/usage.txt` folder.


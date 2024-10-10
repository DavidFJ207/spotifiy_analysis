#### Preamble ####
# Purpose: Downloads and saves the data from Toronto Open Data
# Author: Gadiel David Flores
# Date: 19 September, 2024
# Contact: davidgadiel.flores@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####

# Get package
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
package
resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
data <- filter(datastore_resources, row_number() == 1) %>% get_resource()

#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv")

         

#### Preamble ####
# Purpose: Simulates marriage licence statistics
# Author: Gadiel David Flores
# Date: 19 September, 2024
# Contact: gadieldavid.flores@mail.utoronto.ca
# License: MIT
# Pre-requisites: Nothing
# Any other information needed? Nothing


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
#### Simulate data ####
set.seed(304)

num_days <- 10

start_date <- as.Date("2023-01-01")
dates <- seq(start_date, by = "day", length.out = num_days)

marriage_licenses <- rpois(num_days, lambda = 10)

marriage_data <- data.frame(
  Date = dates,
  LicensesIssued = marriage_licenses
)

write.csv(marriage_data, "marriage_license_data.csv", row.names = FALSE)

ggplot(marriage_data, aes(x = Date, y = LicensesIssued)) +
  geom_line(color = "blue") +
  labs(title = "Daily Marriage Licenses Issued",
       x = "Date",
       y = "Number of Licenses Issued") +
  theme_minimal()




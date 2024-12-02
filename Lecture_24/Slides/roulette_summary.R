## Load packages
library(tidyverse)
library(readxl)

## Load data
data_file <- "roulette_data.xlsx"

roulette <- read_xlsx(data_file)

## Create histogram
roulette |> 
  ggplot(aes(x = Balance)) +
  geom_histogram()


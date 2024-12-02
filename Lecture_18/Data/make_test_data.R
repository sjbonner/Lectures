## Load packages
library(tidyverse)
library(writexl)

## Parameters
n <- 75
mu <- 2
sigmasq <- 3

## Compute parameters of gamma
beta <- sigmasq/mu
alpha <-mu/beta

## Simulate data
test_dat <- tibble(ID = 1:n,
                   Distance = rgamma(n, alpha, scale = beta))

## Write test data
write_xlsx(test_dat, "lecture_18_test_data.xlsx")


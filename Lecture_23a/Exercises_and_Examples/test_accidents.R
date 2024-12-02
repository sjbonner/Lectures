## Load packages
library(tidyverse)

## Simulate
nrep <- 100000

mysim <- tibble(rep = 1:nrep,
                N = 50,
                rbinom(nrep,1000, .05)) |> 
  rowwise() |> 
  summarise(cost = sum(rnorm(N, 5000, 750)))

mean(mysim$cost)
var(mysim$cost)
sd(mysim$cost)


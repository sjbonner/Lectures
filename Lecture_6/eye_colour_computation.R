## Load packages
library(tidyverse)

##### Parameters #####

# Number of dominant alleles (Brown papers) created
totA <- 150

# Number of recessive alleles (Blue papers) created
tota <- 150

# Number of dominant alleles remaining
remA <- 58

# Number of dominant alleles remaining
rema <- 44

# Number of dominant alleles in population
nA <- totA - remA

# Number of recessive alleles in population
na <- tota - rema 

##### Calculated values #####

# Total population size
n <- (nA + na)/2

# Proportion of dominant allele
p <- nA/(nA + na)

# Expected values of genotypes
results <- tibble(Genotype = c("AA","Aa","aa"),
                  Prop = c(p^2, 2*p*(1-p), (1-p)^2),
                  Predict = round(n * Prop),
                  SE = sqrt(n * Prop * (1-Prop)), 
                  Lower95 = round(Predict - 1.96 * SE),
                  Upper95 = round(Predict + 1.96 * SE))

##### Simulation #####
reps <- 1000

sim <- tibble(Rep = 1:reps,
              AA = rbinom(reps, n, p^2),
              aa = rbinom(reps, n-AA, (1-p)^2/(1-p^2)),
              Aa = n - AA -aa) |> 
  pivot_longer(-Rep,values_to = "Count", names_to = "Genotype") |> 
  group_by(Genotype) |> 
  summarize(Prop = mean(Count/n),
            Predict = mean(Count),
            SE = sd(Count),
            Lower95 = quantile(Count, .025),
            Upper95 = quantile(Count, .975))



## Load packages
library(tidyverse)

## Joint pdf
mydata <- crossing(v1 = 1:3,
                   v2 = 1:3) |> 
  mutate(s = v1 + v2,
         d = abs(v1 - v2),
         n = 1,
         p=1/9) 
  
jpdf <- mydata |> 
  group_by(s,d) |> 
  summarize(n = sum(n),
            p = sum(p)) |> 
  select(s,d,p) |> 
  pivot_wider(names_from = d, values_from = p) |> 
  replace_na()


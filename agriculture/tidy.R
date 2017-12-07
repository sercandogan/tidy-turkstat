# Tidy Data

# LOAD PACKAGES ------------------------------------------------
library(tidyverse)
source("tr_to_en.R")

# LOAD DATA -----------------------------------------------------

agr <- read_csv("agriculture/agricultural-prices.csv")

# fill cities and types
agr <- agr %>%
  fill(city) %>%
  fill(type)

agr <- filter(agr, type != "10.11.44.00.00. (Ham Post Ve Deriler (Koyun Ve Kuzuların)) - Adet Sayısı")

# for type
agr$type <- gsub("^\\S*","",agr$type)
agr$type <- gsub("- Kilogram","",agr$type)


# for city

agr$city <- gsub("-[[:digit:]]+","",agr$city)
agr$city <- tr_to_en(agr$city)

write_csv(agr, "agriculture/clean-agricutural-prices.csv")




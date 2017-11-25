# TIDY DATA


# LOAD PACKAGES ---------------------------------------------------------
library(tidyverse)
source("tr_to_en.R") # turkish cracters to english chracters function

# theater/seat.csv
# theater/theater-hall.csv
# theater/theater-play.csv
# theater/theater-performance.csv
# theater/audiences.csv

datafile <- "theater/audiences.csv"

data <- read_csv(datafile) 

data <- data %>% 
  fill(year)

data$city <- gsub("(-+.+)","",data$city)
data$city <- tr_to_en(data$city)

# FOR theater-play.csv & theater-performance.csv  & audiences.csv -------------------

data$type <- gsub("[[:digit:]]. \\(","",data$type)
data$type <- gsub(")","",data$type)
data <- data %>% 
  fill(type)


write_csv(data,datafile)

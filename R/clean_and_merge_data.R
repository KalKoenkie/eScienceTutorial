library(tidyverse)
library(readxl)

# Load in data from the xlsx files in the folder
data <- list.files(path = "data", pattern = "*.xlsx", full.names = TRUE) %>% 
  map(read_xlsx)

# For each file in the folder, pivot it wider and add it to a dataframe. Each file has a different values column name



# Pivot the data

data2 <- pivot_longer(data = data, cols = "Individual ID", names_to = "Variables")

# Solution

get_observation <- function(filename){
raw_file <- read_xlsx(path = filename)

transposed <- as.data.frame(t(raw_file))

observation <- transposed[2,]

observation
}

files <- list.files(path = "data/raw/datafiles/", pattern = "*.xlsx", full.names = TRUE)

cleaned <- data.frame(colnames())

for (file in files) {
  row <- get_observation(file)
  cleaned <- rbind(cleaned, row)
}


write.csv(cleaned, "data/clean/cleaned.csv")


## Load libraries
library(tibble)
library(dplyr)
library(plyr)
library(readr)
library(purrr)

## Set working directory
setwd("C:/Users/neliq/Documents")

# Load files and join them by "wavenumber' column
files <- list.files(pattern = '.csv', full.names = TRUE) %>% 
  lapply(read_csv) %>%
  reduce(full_join, by = "Wavenumber")

# Convert columns to rownames and conver the tibble into a dataframe
files %>%
  mutate(sprintf("%0.2f", Wavenumber)) %>%
  column_to_rownames(var = 'Wavenumber') %>%
  as.data.frame() -> files_df
  
# List the id of each sample and rename your columnds  
list_names <- c('SOG096977', 'SOG096976')  
colnames(files_df) <- list_names


# Transpose your rows to columns and rename by the sequence of wavenumbers
files_df_t <- as.data.frame(t(files_df))
colnames(files_df_t) <- round(as.numeric(rownames(files_df),0))
head(files_df_t)

## code to prepare `DATASET` dataset goes here
# Load libraries
library(tidyverse)
library(tidytuesdayR)
library(reshape2)
library(here)

bob_ross <- read_csv("data-raw/bob_ross.csv")

# Summarize the color usage data
color_usage <- bob_ross %>%
  select(Black_Gesso:Alizarin_Crimson) %>%
  summarise(across(everything(), ~ sum(. == TRUE, na.rm = TRUE)))

color_columns <- colnames(bob_ross)[grepl("Black_Gesso|Bright_Red|Burnt_Umber|Cadmium_Yellow|Dark_Sienna|Indian_Red|Indian_Yellow|Liquid_Black|Liquid_Clear|Midnight_Black|Phthalo_Blue|Phthalo_Green|Prussian_Blue|Sap_Green|Titanium_White|Van_Dyke_Brown|Yellow_Ochre|Alizarin_Crimson", colnames(bob_ross))]

# Convert to long format
color_usage_long <- tidyr::pivot_longer(color_usage, cols = everything(), names_to = "Color", values_to = "Count")

# Separate the most and least used colors
most_used_colors <- color_usage_long %>% arrange(desc(Count)) %>% head(5)
least_used_colors <- color_usage_long %>% arrange(Count) %>% head(5)

# Subset the color columns and create a color co-occurrence matrix
color_matrix <- bob_ross[, color_columns]
color_cooccurrence <- as.matrix(t(color_matrix)) %*% as.matrix(color_matrix)

# Convert to a long format for plotting
melted_cooccurrence <- melt(color_cooccurrence)

usethis::use_data(bob_ross, overwrite = TRUE)

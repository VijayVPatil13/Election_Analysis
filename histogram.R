# Load required libraries
library(readr)
library(ggplot2)

# Read the CSV file
df <- read_csv("party_distribution_2024.csv")

ggplot(df, aes(x = `Total Votes`)) +
  geom_histogram(binwidth = 50000, fill = "darkgreen", color = "black") +
  labs(title = "Histogram of Total Votes (2024)",
       x = "Total Votes", y = "Number of Candidates") +
  theme_minimal()


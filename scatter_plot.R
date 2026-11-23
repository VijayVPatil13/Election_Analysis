library(ggplot2)
library(readr)
library(dplyr)

df <- read_csv("party_distribution_2024.csv")

ggplot(df, aes(x = `Total Votes`, y = Margin)) +
  geom_point(alpha = 0.6, color = "blue") +
  labs(title = "Scatter Plot: Total Votes vs Margin",
       x = "Total Votes", y = "Vote Margin") +
  theme_minimal()


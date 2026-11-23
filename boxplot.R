library(ggplot2)
library(readr)
library(dplyr)

df <- read_csv("party_distribution_2024.csv")
filtered_df <- df %>% filter(Party %in% c("BJP", "INC"))

# Create the boxplot
ggplot(filtered_df, aes(x = Party, y = `Total Votes`)) +
  geom_boxplot(fill = c("orange", "blue"), color = "black") +
  labs(title = "Total Votes Distribution: BJP vs INC (2024)",
       x = "Party", y = "Total Votes") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


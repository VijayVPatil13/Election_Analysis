library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(reshape2)

df <- read_csv("party_distribution_2024.csv")

# Filter for BJP and INC only
filtered_df <- df %>%
  filter(Party %in% c("BJP", "INC"))

# Group by State and Party and calculate average margin
agg_data <- filtered_df %>%
  group_by(`State/Ut`, Party) %>%
  summarise(avg_margin = mean(Margin, na.rm = TRUE)) %>%
  ungroup()

# Reshape to wide and back to long for plotting
agg_wide <- pivot_wider(agg_data, names_from = Party, values_from = avg_margin)
agg_long <- melt(agg_wide, id.vars = "State/Ut", variable.name = "Party", value.name = "Average Margin")

# Plot heatmap
ggplot(agg_long, aes(x = Party, y = `State/Ut`, fill = `Average Margin`)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey90") +
  labs(title = "Average Vote Margin by State (BJP vs INC)",
       x = "Party", y = "State/UT") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


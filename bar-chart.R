library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv("historical_election_by_region.csv")

aggregated_data <- data %>%
  group_by(year, Region, Party) %>%
  summarise(TotalSeats = sum(SeatsWon, na.rm = TRUE), .groups = "drop")

ggplot(aggregated_data, aes(x = factor(year), y = TotalSeats, fill = Party)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~Region, scales = "free_y") +
  labs(title = "Historical Election Results by Region",
       x = "Year",
       y = "Total Seats Won",
       fill = "Party") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#ggsave("historical_election_results_by_region_plot.png", width = 12, height = 8)

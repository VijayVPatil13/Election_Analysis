library(tidyverse)

party_data <- read_csv("party_distribution_2024.csv")

seats_won <- party_data %>%
  group_by(Party) %>%
  summarise(Seats_Won = n()) %>%
  arrange(desc(Seats_Won))

seats_won <- seats_won %>%
  mutate(Percentage = round(100 * Seats_Won / sum(Seats_Won), 1),
         Label = paste0(Party, " (", Percentage, "%)"))

p <- ggplot(seats_won, aes(x = "", y = Seats_Won, fill = Label)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y") +
  labs(title = "Party Distribution by Seats Won (2024 Election)") +
  theme_void() +
  theme(legend.position = "right")
print(p)


#ggsave("seats_won_pie_chart.png", plot = p, width = 8, height = 8, dpi = 300)

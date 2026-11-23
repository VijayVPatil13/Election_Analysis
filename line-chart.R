library(ggplot2)
library(tidyr)
library(dplyr)

data <- read.csv("Pre_Post_poll.csv")

data$Party <- as.factor(data$Party)

data_long <- data %>%
  pivot_longer(cols = c(ExitPoll, Actual), 
               names_to = "Type", 
               values_to = "Votes")

party_colors <- scales::hue_pal()(length(unique(data$Party)))
names(party_colors) <- levels(data$Party)

p <- ggplot(data_long, aes(x = Year, y = Votes, color = Party, linetype = Type)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Poll Results vs Actual Results Over Time",
       x = "Year",
       y = "Number of Votes",
       color = "Party",
       linetype = "Result Type") +
  scale_color_manual(values = party_colors) +
  theme_minimal() +
  scale_x_continuous(breaks = unique(data$Year)) +
  theme(legend.position = "bottom")

print(p)


#ggsave("poll_vs_actual.png", plot = p, width = 12, height = 7, dpi = 300)

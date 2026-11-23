library(readr)
library(GGally)
library(dplyr)

df <- read_csv("party_distribution_2024.csv")

filtered_df <- df %>%
  filter(Party %in% c("BJP", "INC")) %>%
  mutate(Party = factor(Party)) %>%
  select(Age, `Total Votes`, Margin, Party)

# Pair plot colored by Party
ggpairs(filtered_df, aes(color = Party),
        title = "Pair Plot: BJP vs INC Candidates",
        upper = list(continuous = wrap("cor", size = 3)),
        diag = list(continuous = wrap("densityDiag", alpha = 0.5)),
        lower = list(continuous = wrap("points", alpha = 0.6)))


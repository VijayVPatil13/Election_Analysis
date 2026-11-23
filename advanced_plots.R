library(ggplot2)
library(treemap)

df <- read.csv("party_distribution_2024.csv")

# --- 1. KDE Plot (Kernel Density Estimate) ---
# Visualizing the distribution of 'Age'
ggplot(df, aes(x = Age)) +
  geom_density(fill = "skyblue", color = "blue", alpha = 0.7) +
  labs(title = "KDE Plot of Candidate Age",
       x = "Age",
       y = "Density") +
  theme_minimal()

# --- 2. Violin Plot ---
# Visualizing the distribution of 'Age' by 'Gender'
ggplot(df, aes(x = Gender, y = Age, fill = Gender)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Violin Plot of Candidate Age by Gender",
       x = "Gender",
       y = "Age") +
  theme_minimal()


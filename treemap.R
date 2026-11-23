library(treemap)
library(dplyr)

df <- read.csv("party_distribution_2024.csv")

# --- Data Preparation: Filter for Top 5 States by Total Votes ---

# Calculate total votes per state
total_votes_by_state <- df %>%
  group_by(State.Ut) %>%
  summarise(Total_Votes_Sum = sum(Total.Votes, na.rm = TRUE)) %>%
  arrange(desc(Total_Votes_Sum))

# Get the names of the top 5 states
top_5_state_names <- head(total_votes_by_state$State.Ut, 5)

# Filter the original DataFrame to include only the top 5 states
df_filtered_top5 <- df %>%
  filter(State.Ut %in% top_5_state_names)

# Check for missing values in the relevant columns within the filtered data
cat("Missing values in 'State/Ut' (filtered):", sum(is.na(df_filtered_top5$State.Ut)), "\n")
cat("Missing values in 'Party' (filtered):", sum(is.na(df_filtered_top5$Party)), "\n")
cat("Missing values in 'Total Votes' (filtered):", sum(is.na(df_filtered_top5$Total.Votes)), "\n")

# Ensure 'Total Votes' is numeric in the filtered dataframe
df_filtered_top5$Total.Votes <- as.numeric(df_filtered_top5$Total.Votes)

# --- Treemap Plot for Top 5 States ---
# Visualizing the distribution of 'Total Votes' by 'State/Ut' and then 'Party'
treemap(df_filtered_top5, # Use the filtered dataframe
        index = c("State.Ut", "Party"), # Hierarchy levels: State/Ut first, then Party
        vSize = "Total.Votes",          # Column determining the size of the rectangles
        vColor = "State.Ut",            # Color by State/Ut
        type = "categorical",           # Type of treemap based on coloring
        title = "Treemap of Total Votes by Party for Top 5 States",
        fontsize.title = 14,
        fontsize.labels = c(12, 8),
        align.labels = list(c("left", "top"), c("right", "bottom")),
        bg.labels = c("white"),
        palette = "Paired" # A color palette
)

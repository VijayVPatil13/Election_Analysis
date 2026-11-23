library(dplyr)
library(readr)
library(corrplot)

df <- read.csv("party_distribution_2024.csv")

numeric_df <- df %>% select(where(is.numeric))

cor_matrix <- cor(numeric_df, use="complete.obs")
print(cor_matrix)

# Set larger top margin and allow plotting outside plot region
# The values are in lines: c(bottom, left, top, right)
# xpd = TRUE allows plotting outside the plot region.
par(mar = c(5, 4, 7, 2) + 0.1, xpd = TRUE) # Increased top margin and set xpd = TRUE

corrplot(cor_matrix, method = "color", type = "upper",
         tl.col = "black", tl.srt = 45,
         addCoef.col = "black", number.cex = 0.7)

# 'line' controls the vertical position (higher values move it up)
# 'cex' controls the text size
mtext("Correlation Matrix\nAge, Total and Margin", side = 3, line = 4, cex = 1.2, font = 2)

# Reset margins and xpd to default after plotting (good practice)
par(mar = c(5, 4, 4, 2) + 0.1, xpd = FALSE)


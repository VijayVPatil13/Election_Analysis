library(tidyverse)
library(caret)
library(e1071)

data <- read_csv("historical_election_by_region.csv")
data <- data %>%
  filter(year >= 1991) %>%
  mutate(
    Party = as.factor(Party),
    Region = as.factor(Region)
  ) %>%
  select(year, Region, SeatsWon, Party)

dummies_model <- dummyVars(Party ~ ., data = data)
data_transformed <- predict(dummies_model, newdata = data)
data_transformed <- as.data.frame(data_transformed)

data_transformed$Party <- data$Party

set.seed(123)
train_index <- createDataPartition(data_transformed$Party, p = 0.8, list = FALSE)
train_data <- data_transformed[train_index, ]
test_data <- data_transformed[-train_index, ]

model <- train(Party ~ ., data = train_data, method = "rf")
predictions = predict(model, newdata = test_data)

actual <- test_data$Party
conmat <- confusionMatrix(predictions, actual)
print(conmat)
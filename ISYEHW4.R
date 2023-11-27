# Install the necessary package if it's not already installed
if (!require(naivebayes)) install.packages('naivebayes')

library(naivebayes)

# data frame
car_data <- data.frame(
  Color = factor(c('Red', 'Red', 'Red', 'Yellow', 'Yellow', 'Yellow', 'Yellow', 'Yellow', 'Red', 'Red')),
  Type = factor(c('Sports', 'Sports', 'Sports', 'Sports', 'Sports', 'SUV', 'SUV', 'SUV', 'SUV', 'Sports')),
  Origin = factor(c('Domestic', 'Domestic', 'Domestic', 'Domestic', 'Imported', 'Imported', 'Imported', 'Domestic', 'Imported', 'Imported')),
  Stolen = factor(c('No', 'No', 'No', 'No', 'Yes', 'No', 'Yes', 'No', 'No', 'Yes'))
)

# naive Bayes model
nb_model <- naive_bayes(Stolen ~ ., data = car_data)
prediction <- predict(nb_model, newdata = data.frame(Color = 'Red', Type = 'Sports', Origin = 'Imported'))
prediction

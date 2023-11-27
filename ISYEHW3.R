install.packages("arules")
library(arules)

transactions <- read.transactions(text = "items
T1 {Milk, Bread}
T2 {Milk, Diapers}
T3 {Diapers, Beer}
T4 {Bread, Diapers}
T5 {Milk, Beer}")

rules <- apriori(transactions, parameter = list(support = 0.4, confidence = 0.6))
inspect(rules)



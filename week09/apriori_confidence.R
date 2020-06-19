#install.packages('arules');
library(arules);
data(Groceries);

cat('\n------------------Confidence------------------\n')
highest_confidence <- apriori(Groceries, parameter = list(supp=0.001, conf=0.1))
highest_confidence <- sort(highest_confidence, decreasing = TRUE, by = "confidence")
inspect(highest_confidence)
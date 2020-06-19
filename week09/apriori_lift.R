#install.packages('arules');
library(arules);
data(Groceries);

cat('\n------------------Lift------------------\n')
highest_lift <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.1))
highest_lift <- sort(highest_lift, decreasing = TRUE, by = "lift")
inspect(highest_lift)
#install.packages('arules');
library(arules);
data(Groceries);

# Highest support with empty antecedents (lhs) allowed
cat('\n------------------Support (empty antecedents allowed)------------------\n')
highest_support <- apriori(Groceries, parameter = list(supp=0.001, conf=0.0))
highest_support <- sort(highest_support, decreasing = TRUE, by = "support")
inspect(highest_support)

# Highest support with non-empty antecedents
cat('\n------------------Support (non-empty antecedents)------------------\n')
highest_support2 <- apriori(Groceries, parameter = list(supp=0.001, conf=0.0, minlen=2))
highest_support2 <- sort(highest_support2, decreasing = TRUE, by = "support")
inspect(highest_support2)
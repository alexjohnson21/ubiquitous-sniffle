library(datasets)
library(cluster)

# Step 1 - Load the dataset
data <- state.x77

# Step 2 - Cluster the data on all attributes and produce a dendrogram
distance <- dist(as.matrix(data))
hc <- hclust(distance)
plot(hc)

# Step 3 - Repeat Step 2 but normalize the dataset and note any differences
data_scaled <- scale(data)
distance <- dist(as.matrix(data_scaled))
hc <- hclust(distance)
plot(hc)

# Step 4 - Remove "area" from the attributes and re-cluster and note differences
data_scaled_no_area <- scale(data[, c("Population", "Income", "Illiteracy", "Life Exp", "Murder", "HS Grad", "Frost")])
distance <- dist(as.matrix(data_scaled_no_area))
hc <- hclust(distance)
plot(hc)

# Step 5 - Cluster only on the Frost attribute and observe the results
data_scaled_frost_only <- scale(data[, "Frost"])
distance <- dist(as.matrix(data_scaled_frost_only))
hc <- hclust(distance)
plot(hc)
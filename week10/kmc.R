library(datasets)
library(cluster)

# Step 1 - Load and normalize the dataset
data <- state.x77
data <- scale(data)

# Step 2 - Cluster the data into 3 clusters and note size and mean values
clusters <- kmeans(data, 3)
summary(clusters) # sizes of attributes within cluster frame
print(clusters$centers[, c("Population", "Income", "Illiteracy", "Life Exp")]) # mean values of the clusters
print(clusters$centers[, c("Murder", "HS Grad", "Frost", "Area")]) # mean values of the clusters
clusplot(data, clusters$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# Step 3 - Loop from k=1 to 25 and plot the sum-of-squares error for each k value
errors <- c()
for (k in 1:25) 
{
  errors[k] <- kmeans(data, k)$tot.withinss
}

plot(errors, xlab = "k", ylab = "Sum-of-squares error")

# Step 04 - Choose an apppropriate k using the elbow method on the errors plot
clusters <- kmeans(data, 7)
clusplot(data, clusters$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# Step 5 - List the states in each cluster
print(clusters$cluster)

# Step 6 - Use clusplot to plot the clustering
clusplot(data, clusters$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
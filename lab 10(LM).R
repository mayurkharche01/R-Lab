library(dplyr)
library(ggplot2)
library(factoextra)

data("iris")
iris_data <- iris [, 1:4]

fviz_nbclust(iris_data, kmeans, method = "wss")+
  labs(title = "Elbow Method for Optimal K")

set.seed(123)
kmeans_model <- kmeans(iris_data, centers = 3, nstart = 20)

kmeans_model$cluster [1:10]

table(kmeans_model$cluster, iris$Species)

fviz_cluster(kmeans_model, data = iris_data,
             
             ellipse.type = "norm",
             palette = "jco",
             ggtheme = theme_minimal())

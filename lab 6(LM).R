library(dplyr)
library(ggplot2)
library(GGally)
library(ggcorrplot)

data("iris")
head(iris)

summary(iris)

ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram (bins = 20, fill = "lightblue", color = "black") + 
labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Frequency")

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Sepal Length vs Petal Length")

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species))
geom_boxplot() +
  labs (title = "Boxplot of Sepal Width by Species")

corr_matrix = cor(iris[, 1:4])
corr_matrix
ggcorrplot(corr_matrix, lab=TRUE, title="Correlation Matrix Heatmap")

ggpairs(iris[, 1:4])

library(dplyr)

data("iris")

t_test_result <- t.test(Sepal.Length ~ Species,
                        data = iris %>% filter(Species %in% c("setosa", 
                                                              "versicolor")))
t_test_result

anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)

correlation <- cor(iris$Sepal.Length, iris$Petal.Length)
correlation

cor_test <- cor.test(iris$Sepal.Length, iris$Petal.Length)
cor_test

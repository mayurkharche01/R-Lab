library(dplyr)

data("iris")
head(iris)
str(iris)
summary(iris)

data("mtcars")
head(mtcars)
str(mtcars)

data("Titanic")
Titanic

sum(is.na(iris)) 
colSums(is.na(mtcars)) 

iris %>%
  group_by(Species) %>%
  summarise(
    Avg_Sepal_Length = mean(Sepal.Length),
    Avg_Petal_Length = mean(Petal.Length)
  )


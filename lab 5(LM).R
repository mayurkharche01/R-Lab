library(dplyr)
library(caret)

data("mtcars")
head(mtcars)

mtcars$mpg_category <- cut(mtcars$mpg,
                           breaks = c(-Inf, 15, 25, Inf),
                           labels = c("Low", "Medium", "High"))
table(mtcars$mpg_category)

data("iris")
iris$Species_code <- as.numeric(as.factor(iris$Species))
head(iris[, c("Species", "Species_code")])

mtcars$wt_normalized <- (mtcars$wt - min(mtcars$wt)) / (max(mtcars$wt) - min(mtcars$wt))
head(mtcars$wt_normalized)

mtcars$hp_zscore <- scale(mtcars$hp)
head(mtcars$hp_zscore)

mtcars$power_to_weight <- mtcars$hp / mtcars$wt
head(mtcars$power_to_weight)


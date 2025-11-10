library(dplyr)
library(ggplot2)
# Load dataset
data("mtcars")
head(mtcars)

model_simple <- lm(mpg~ wt, data = mtcars)
summary(model_simple)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue"( + geom_smooth(method = "lm", se = TRUE, color = "red") +
                               labs(title = "Simple Linear Regression: MPG vs Weight", x = "Weight (1000 lbs)", y = "Miles per Gallon")
                             
model_multiple <- lm(mpg ~ wt + hp, data = mtcars)
summary(model_multiple)
                             
plot (model_multiple, which = 1) 
plot (model_multiple, which = 2)
                             
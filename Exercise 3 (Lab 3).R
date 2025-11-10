#Part A: Descriptive Statistics & Visual Summaries (mtcars)

data(mtcars)

# for nicer plots
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
#1.Mean, median, mode, variance, sd, range of mpg:
mpg <- mtcars$mpg

# basic stats
mean_mpg <- mean(mpg)
median_mpg <- median(mpg)

# mode function (statistical mode)
get_mode <- function(v) {
  uniqv <- unique(v)
  freq <- tabulate(match(v, uniqv))
  uniqv[which.max(freq)]
}
mode_mpg <- get_mode(mpg)

var_mpg <- var(mpg)       # sample variance
sd_mpg <- sd(mpg)         # sample standard deviation
range_mpg <- range(mpg)   # c(min, max)
mpg_stats <- list(mean=mean_mpg, median=median_mpg, mode=mode_mpg,
                  variance=var_mpg, sd=sd_mpg, range=range_mpg)
mpg_stats
#2. Frequency table of cyl:
table(mtcars$cyl)
prop.table(table(mtcars$cyl))  # proportions
#3. Histogram of mpg with density overlay (base R and ggplot2 version):
# base R
hist(mpg, prob=TRUE, main="Histogram of mpg with density",
     xlab="mpg", breaks=10)
lines(density(mpg), lwd=2)

# ggplot2
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y=..density..), bins=10, alpha=0.5) +
  geom_density(size=1) +
  ggtitle("mpg histogram with density curve")
#4. Boxplot of mpg by cyl and interpret spread:
# boxplot
boxplot(mpg ~ cyl, data=mtcars, main="mpg by cylinder count",
        xlab="Number of cylinders", ylab="mpg")

# ggplot2
ggplot(mtcars, aes(x=factor(cyl), y=mpg)) +
  geom_boxplot() +
  xlab("cyl") + ylab("mpg") + ggtitle("Boxplot: mpg by cyl")
#5. summary() of dataset:
summary(mtcars)






# Part B: Probability & Distributions (R, base graphics)

# 1. Mean and sd of Sepal.Length
data(iris)                       # builtin dataset
sepal <- iris$Sepal.Length
mean_sepal <- mean(sepal)
sd_sepal   <- sd(sepal)          # sample sd to match R's sd()

cat("Sepal.Length mean =", mean_sepal, "\n")
cat("Sepal.Length sd   =", sd_sepal, "\n\n")

# 2. Plot normal distribution curve (with histogram overlay)
# Create x range wide enough to cover the data
x <- seq(min(sepal) - 1, max(sepal) + 1, length.out = 300)
y <- dnorm(x, mean = mean_sepal, sd = sd_sepal)

# Plot histogram with density scale (prob=TRUE), then overlay PDF line
hist(sepal,
     prob = TRUE,               # important: use density scale so the PDF aligns
     breaks = 10,
     main = "Histogram of Sepal.Length with Normal PDF",
     xlab = "Sepal.Length (cm)",
     ylab = "Density",
     col = "lightgoldenrod",
     border = "white")
lines(x, y, lwd = 2)            # overlay normal pdf
box()                           

# 3. Shapiro-Wilk test for normality
sh <- shapiro.test(sepal)
print(sh)
if (sh$p.value > 0.05) {
  cat("Shapiro-Wilk: fail to reject H0 (approx normal)\n")
} else {
  cat("Shapiro-Wilk: reject H0 (evidence of non-normality)\n")
}
cat("\n")

# 4. Simulate 1000 samples from Binomial(n=10, p=0.5) and plot histogram
set.seed(42)
n <- 10; p <- 0.5
samps <- rbinom(1000, size = n, prob = p)

# Use breaks = seq(-0.5, n + 0.5, 1) to create integer-centered bars
hist(samps,
     breaks = seq(-0.5, n + 0.5, by = 1),
     main = sprintf("Histogram of 1000 draws: Binomial(n=%d, p=%.2f)", n, p),
     xlab = "Number of successes",
     ylab = "Frequency",
     col = "lightblue",
     right = FALSE)            # left-aligned bins (makes counts exactly for integers)
axis(side = 1, at = 0:n)       # label 0..n on x-axis

# 5. Compare sample mean and variance with theoretical values
sample_mean <- mean(samps)
sample_var  <- var(samps)       # sample variance
theo_mean   <- n * p
theo_var    <- n * p * (1 - p)

cat("Binomial simulation (1000 draws):\n")
cat("  Sample mean     =", sample_mean, "\n")
cat("  Sample variance =", sample_var, "\n")
cat("Theoretical:\n")
cat("  Mean             =", theo_mean, "\n")
cat("  Variance         =", theo_var, "\n")

library(ggplot2)

# Normal + histogram
df <- data.frame(sepal = iris$Sepal.Length)
ggplot(df, aes(x = sepal)) +
  geom_histogram(aes(y = ..density..), bins = 10, fill = "lightgoldenrod", color = "white") +
  stat_function(fun = dnorm, args = list(mean = mean_sepal, sd = sd_sepal), size = 1.2) +
  labs(title = "Sepal.Length with Normal PDF", x = "Sepal.Length", y = "Density")

# Binomial histogram
samps_df <- data.frame(samps = samps)
ggplot(samps_df, aes(x = samps)) +
  geom_bar(fill = "lightblue", color = "white") +
  scale_x_continuous(breaks = 0:n) +
  labs(title = "Binomial(n=10, p=0.5) samples (1000 draws)", x = "Number of successes", y = "Frequency")

hist(iris$Sepal.Length)

# Load ggplot2
library(ggplot2)

# Use the built-in iris dataset
data(iris)

# Calculate mean and sd of Sepal.Length
mean_sepal <- mean(iris$Sepal.Length)
sd_sepal <- sd(iris$Sepal.Length)

ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(aes(y = ..density..), 
                 bins = 10, fill = "lightblue", color = "black") +
  stat_function(fun = dnorm,
                args = list(mean = mean_sepal, sd = sd_sepal),
                color = "red", size = 1.2) +
  labs(title = "Sepal.Length with Normal Distribution Curve",
       x = "Sepal.Length", y = "Density")




#Part C: Estimation & Confidence Intervals
#1 — 95% CI for the mean of mpg (analytical, t-interval)
# 1. 95% CI for mean(mpg)
data(mtcars)                # builtin dataset
x <- mtcars$mpg
n <- length(x)
xbar <- mean(x)
s <- sd(x)
se <- s / sqrt(n)

alpha <- 0.05
tcrit <- qt(1 - alpha/2, df = n - 1)
ci_lower <- xbar - tcrit * se
ci_upper <- xbar + tcrit * se

# Print results
cat("n =", n, "\n")
cat("mean(mpg) =", round(xbar,4), "sd =", round(s,4), "se =", round(se,4), "\n")
cat("95% CI for mean(mpg): [", round(ci_lower,4), ",", round(ci_upper,4), "]\n")

shapiro.test(x)   # Shapiro-Wilk normality test
hist(x, main="Histogram of mpg", xlab="mpg")
boxplot(x, main="Boxplot of mpg")


#2. — Bootstrap CI for hp (horsepower) using the boot package
library(boot)
set.seed(123)   # reproducible
# Data
hp <- mtcars$hp
# Statistic function for boot (returns mean)
boot_mean_hp <- function(data, indices) {
  d <- data[indices]
  return(mean(d))
}
# Run bootstrap
R <- 2000
boot_out <- boot(data = hp, statistic = boot_mean_hp, R = R)
# View basic bootstrap result
print(boot_out)
# Bootstrap CIs: percentile and BCa (both common)
boot_ci_percentile <- boot.ci(boot_out, type = "perc")
boot_ci_bca <- boot.ci(boot_out, type = "bca")

boot_ci_percentile
boot_ci_bca

# plot histogram of bootstrap replicates
boot_reps <- boot_out$t[,1]    # the bootstrap replicate means
hist(boot_reps, main = "Bootstrap distribution of mean(hp)",
     xlab = "mean(hp)")
abline(v = mean(hp), lwd = 2)
abline(v = quantile(boot_reps, c(0.025, 0.975)), col = "red", lwd = 2, lty = 2)


#3. — Compare confidence intervals of mpg for automatic vs manual cars (am variable)

library(dplyr)
# Prepare
mt <- mtcars %>% mutate(am_f = factor(am, levels = c(0,1), labels = c("Auto","Manual")))

group_sum <- mt %>% group_by(am_f) %>%
  summarise(n = n(), mean_mpg = mean(mpg), sd = sd(mpg), se = sd/sqrt(n))
print(group_sum)

# 95% CI by group (manual calc)
alpha <- 0.05
group_ci <- mt %>% group_by(am_f) %>%
  summarise(
    n = n(),
    mean = mean(mpg),
    sd = sd(mpg),
    se = sd/sqrt(n),
    tcrit = qt(1-alpha/2, df = n-1),
    lower = mean - tcrit * se,
    upper = mean + tcrit * se
  )
print(group_ci)

# t.test for difference in means (two-sample, Welch by default)
tt <- t.test(mpg ~ am_f, data = mt)   # Welch t-test
tt

library(boot)
set.seed(456)

diff_mean_stat <- function(data, indices) {
  d <- data[indices, ]          # resample rows
  mean_manual <- mean(d$mpg[d$am_f == "Manual"])
  mean_auto <- mean(d$mpg[d$am_f == "Auto"])
  return(mean_manual - mean_auto)
}

boot_diff <- boot(data = mt, statistic = diff_mean_stat, R = 2000)
boot_diff
boot.ci(boot_diff, type = c("perc","bca"))
# plot bootstrap replicates
hist(boot_diff$t, main="Bootstrap dist of (Manual - Auto) mean(mpg)", xlab="Difference in means")
abline(v = mean(mt$mpg[mt$am==1]) - mean(mt$mpg[mt$am==0]), col = "blue", lwd = 2)
abline(v = quantile(boot_diff$t, c(0.025,0.975)), col = "red", lwd = 2, lty = 2)


#Part D: Hypothesis Testing

#1. One-sample t-test
data(iris)

t_test1 <- t.test(iris$Sepal.Length, mu = 5.5)

t_test1

#2. Two-sample t-test
data(mtcars)

t_test2 <- t.test(mpg ~ am, data = mtcars)

t_test2

#3. Chi-square test of independence



#4. One-way ANOVA

anova_model <- aov(Sepal.Length ~ Species, data = iris)

summary(anova_model)

#5. Post-hoc Tukey HSD test

tukey_result <- TukeyHSD(anova_model)

tukey_result


#Part E: Correlation & Association

#1. Compute the Pearson correlation between mpg and hp
data(mtcars)

cor_mpg_hp <- cor(mtcars$mpg, mtcars$hp, method = "pearson")
cor_mpg_hp

#2. Plot a scatterplot with regression line of mpg ~ hp

if(!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Scatterplot of mpg vs hp with Regression Line",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

#3. Create a correlation matrix for all numeric columns in mtcars

cor_matrix <- cor(mtcars)

print(cor_matrix)

if(!require(corrplot)) install.packages("corrplot", dependencies = TRUE)
library(corrplot)

corrplot(cor_matrix, method = "color", addCoef.col = "black",
         tl.col = "black", number.cex = 0.7,
         title = "Correlation Matrix - mtcars", mar = c(0,0,1,0))
#4. Compute and interpret the Spearman rank correlation between Sepal.Length and Petal.Length

data(iris)

spearman_corr <- cor(iris$Sepal.Length, iris$Petal.Length, method = "spearman")
spearman_corr

#5. # Install and load arules

if(!require(arules)) install.packages("arules", dependencies = TRUE)
library(arules)

data <- list(
  c("milk", "bread", "butter"),
  c("bread", "butter", "jam"),
  c("milk", "bread"),
  c("milk", "cookies"),
  c("bread", "butter")
)

trans <- as(data, "transactions")

summary(trans)

rules <- apriori(trans, parameter = list(supp = 0.2, conf = 0.6))

inspect(rules)

if(!require(arulesViz)) install.packages("arulesViz", dependencies = TRUE)
library(arulesViz)

plot(rules, method = "graph", engine = "htmlwidget")


#Part F: Mini Data Science Applications

#1. Logistic Regression – Titanic Dataset

library(dplyr)

library(titanic)
data("titanic_train")
titanic <- titanic_train

str(titanic)

titanic_clean <- titanic %>%
  select(Survived, Age, Sex, Pclass) %>%
  filter(!is.na(Age))

titanic_clean$Sex <- as.factor(titanic_clean$Sex)
titanic_clean$Pclass <- as.factor(titanic_clean$Pclass)
titanic_clean$Survived <- as.factor(titanic_clean$Survived)

model_logit <- glm(Survived ~ Age + Sex + Pclass, data = titanic_clean, family = binomial)

summary(model_logit)

exp(coef(model_logit))


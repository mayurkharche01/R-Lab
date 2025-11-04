##1. Variables & Data Types 

###Questions###
#1. Create variables to store:
#- Your name (character)
#- Your age (numeric)
#- Whether you are a student (logical)
#2. Create a vector containing the numbers 1 to 10.
#3. Create a sequence from 5 to 50 with a step size of 5.
#4. Store the names of 5 fruits in a character vector and display the second and fourth fruit.
#5. Create a numeric vector of 10 random numbers between 1 and 100, then find:
#1. Maximum value
#2. Minimum value
#3. Mean
#6. Create a data frame with columns: Name, Age, Marks. Enter at least 5 records.
#7. Write code to sort the data frame by Marks in descending order.



###Answers###

#Q1
name <- "Mayur"
age <- 20
is_student <-TRUE

#Q2
numbers <- c (1,2,3,4,5,6,7,8,9,10)
numbers

#Q3
seqnumbers <- seq(from=5 , to = 50 , by = 5)
seqnumbers

#Q4
fruits <- c("banana", "apple", "orange", "mango", "lemon")
#fruits[2]
#fruits[4]
fruits[c(2,4)]

#Q5
?sample
set.seed(1)
rnums<- sample(1:100,10)
rnums
#max(rnums);min(rnums);mean(rnums)
max(rnums)
min(rnums)
mean(nums)

#Q6
df <- data.frame(
  Name= c("A","B","C","D","E"),
  Age = c(12,13,14,15,16),
  Marks = c(55,66,77,88,99)
)

df

#Q7
?order
df[order(-df$Marks)]

--------------------------------------------------------------------------------
  
  
  #-# 2. Operators in R #-#
  
  
  ####Questions###
  
  #1. Perform the following operations:
  #1. 10 + 5
  #2. 10 - 5
  #3. 10 * 5
  #4. 10 / 5
  #5. 10 %% 3
  #6. 10 %/% 3
  #2. Compare if 15 is greater than 10, and if 7 is equal to 7.
  #3. Create two vectors:
  #1. a <- c(2, 4, 6, 8)
  #2. b <- c(1, 3, 5, 7)
  #Perform:
  #1. Addition
  #2. Subtraction
  #3. Element-wise multiplication
  #4. Use logical operators to check:
  #1. Which elements of a are greater than 5?
  #2. Which elements of b are less than or equal to 4?
  #5. Use %in% to check if the number 5 exists in vector a.
  #6. Given x <- c(TRUE, FALSE, TRUE, FALSE) and y <- c(TRUE, TRUE, FALSE, FALSE), apply:
  #1. &
  #2. |
  #3. !
  
  
  #####ANSWERS######

#Q1
0 + 5
10 - 5
10 * 5
10 / 5
10 %% 3
10 %/% 3

15> 10
7 == 7

a <- c(2, 4, 6, 8)
b <- c(1, 3, 5, 7)
a + b
a - b
a * b

a > 5
a[a>5]

b<=4
b[b<=4]

5 %in% a

x <- c(TRUE, FALSE, TRUE, FALSE)
y <- c(TRUE, TRUE, FALSE, FALSE)

x&y
x|y
x ! y # can be performed on only one vector


--------------------------------------------------------------------------------
  ##3 loops in R
  
  
  ###Questions####

#1. Write a for loop to print numbers from 1 to 10.
#2. Write a while loop to sum numbers from 1 to 100.
#3. Write a loop to print only even numbers between 1 and 50.
#4. Write a loop to print the multiplication table of 7.
#5. Create a loop to calculate the factorial of a given number n.
#6. Write a nested loop to print a star pattern:
```
#   *
#   **
#   ***
#   ****


###ANSWERS####  


#q1
for (x in 1:10) {
  print(x)
}

#q2
sum <- 0
i=0
while (i <= 100) {
  sum = sum+i
  i=i+1
}
sum

#q3
i=0
while(i <=50){
  if(i%%2==0){
    print(i)
  }
  i <- i+1
}


#q4
i=7
j=0
while(j<=12){
  print(paste(i ,"*" , j ,"= ",i*j))
  j <- j+1
}


#q5
factorial(5)

#q6
rows <- 4
for (i in 1:rows) {
  for (j in 1:i) {
    cat("*")
  }
  cat("\n")
}


--------------------------------------------------------------------------------
  ##4. Conditionals in R
  
  ###QUESTIONS###
  #1. Write an if statement to check if a number is positive or negative.
  #2. Write an if-else statement to check if a given number is even or odd.
  #3. Write a program to check if a given year is a leap year.
  #4. Take a numeric input for marks and print:
  #1. “Pass” if marks >= 40
  #2. “Fail” otherwise
  #5. Using nested if-else, assign grades:
  #1. Marks >= 90 → A
  #2. 75–89 → B
  #3. 60–74 → C
  #4. <60 → Fail
  
  
  ####ANSWERS####


#q1
num <- 5

if(num>0){
  print("Number is positive")
}else if(num<0){
  print("Number is negative")
}else{
  print("number is zero")
}

#q2

if(num%%2==0){
  print("Number is Even")
}else{
  print("Number is odd")
}

#q3

year=1900

if(year%%4==0 && year%%100!=0 | year%%400==0){
  print(paste(year,"is a leap year"))
}else{
  print(paste(year, "is not a leap year"))
}

#q4

marks <- as.numeric(readline(prompt="Enter Your Marks"))

if (marks>=40){
  print("You are Pass")
}else{
  print("You are Fail")
}

#q5
if (marks >= 90) {
  print("Grade: A")
} else if (marks >= 75) {
  print("Grade: B")
} else if (marks >= 60) {
  print("Grade: C")
} else {
  print("Grade: Fail")
}

--------------------------------------------------------------------------------
  
  #5. Functions in R
  
  ###QUESTIONS###
  
  #1. Write a function add_numbers(a, b) to return the sum of two numbers.
  #2. Write a function square(n) to return the square of a number.
  #3. Write a function to calculate the factorial of a number using recursion.
  #4. Write a function to check if a number is prime.
  #5. Write a function that takes a vector and returns:
  #1. Mean
  #2. Median
  #3. Standard Deviation 
  #6. Write a function that accepts a data frame and a column name, and returns the
  #top 5 highest values in that column.
  
  ###ANSWERS###
  
  #q1
  add_numbers <- function(a,b){
    return(a+b)
  }
add_numbers(3,5)

#q2
square_numbers <- function(n) {
  return(n * n)
}

square_numbers(6)

#q3
factorial_recursive <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial_recursive(n - 1))
  }
}

factorial_recursive(5)

#q4
is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  for (i in 2:(n - 1)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

is_prime(7)  


#q5
vector_stats <- function(v) {
  mean_val <- mean(v)
  median_val <- median(v)
  sd_val <- sd(v)
  
  return(list(mean = mean_val, median = median_val, sd = sd_val))
}

vector_stats(c(10, 20, 30, 40, 50))

#q6
top_5_values <- function(df, column_name) {
  return(head(df[order(-df[[column_name]]), column_name], 5))
}

data <- data.frame(name = c("A", "B", "C", "D", "E", "F"),
                   marks = c(75, 88, 45, 92, 67, 81))

top_5_values(data, "marks")

-------------------------------------------------------------------------------
  6.

cols<- c("Age","workclass","fnlwgt","education","education_num",
         "marital_status","occupation","relationship","race","sex",
         "capital_gain","capital_loss","hours_per_week","native_country",
         "income")

adult <- read.csv("C:/Users/ajinkya/OneDrive/Documents/Ajinkya Rlab/datasets_lab1
                  /adult-data.txt", header=FALSE, col.names =cols, 
                  strip.white =TRUE, na.strings ="?", stringsAsFactors = FALSE)

#q1-2
print(head(adult,10))
;View(head(adult,10))

#q3
str(adult)

#q4
print(mean(adult$Age, na.rm =TRUE))
print(mean(adult$education))
print(mean(adult$Age, na.rm = FALSE))

#q5
print(table(adult$income))
?table

#q6
occ_counts <- sort(table(adult$occupation), decreasing = TRUE)
occ_counts
most_common_occupation <-names(occ_counts)[1]
print(most_common_occupation)

?names

#q7
print(tapply(adult$hours_per_week,adult$income,mean,na.rm = TRUE))
#na.rm if null values exist ignore

?tapply


#q8
edu_counts <-sort(table(adult$education), decreasing = TRUE)
barplot(edu_counts,las = 2, cex.names =0.7, main="Education Level Distribution", ylab = "Count")
#(edu_counts,las = 2, cex.names =0.7)
#barplot(edu_counts)
?barplot
#las id difference on y axis like 1000 then 3000,5000 etc

#q9
tbl<- with(adult,table(native_country, income))
prop_over50K <- tbl[, ">50k"] / rowSums(tbl)

#optional: filter tiny groups (n<30) to avoid noise
valid <-rowSums(tbl) >= 30 & !is.na(prop_over50K)
prop_over50K <-prop_over50K[vaild]
country_max <-names(sort(prop_over50K, decreasing = TRUE))[1]

print(country_max)

--------------------------------------------------------------------------------------
  
  ##7Data Analysis – IPL Dataset (batting_bowling_ipl_bat.csv)
  
  ###QUESTIONS###
  
  1. Load the IPL dataset into R.
2. Display the first 10 rows.
3. Find the top 5 players with the highest total runs.
4. Find the player with the highest batting average.
5. Create a bar chart for the top 10 players by strike rate.
6. Find the correlation between matches played and runs scored.


###ANSWERS###

#q1

cols <- c("Name","Runs","Ave","SR","Fours","Sixes","HF")

ipl <- read.csv("C:/Users/ajinkya/OneDrive/Documents/Ajinkya Rlab/datasets_lab1/batting_bowling_ipl_bat.csv",
                header=FALSE, col.names =cols, 
                strip.white =TRUE, na.strings ="?", 
                stringsAsFactors = FALSE)

#q2

print(head(ipl,10))
View(head(ipl,10))

#q3
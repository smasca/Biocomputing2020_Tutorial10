# Samantha Masca
# BIOS 30318
# Exercise 8
# TA: Elizabeth Brooks    

# Task 1: generate a graph of the UW vs MSU game 

# load data
setwd("/Users/samanthamasca/Biocomputing2020_Tutorial10/")
data <- read.table(file="UWvMSU_1-22-13.txt",header = TRUE, stringsAsFactors = FALSE)

sumUW <- 0
sumMSU <- 0

for (i in 1:nrow(data)) {
  if (data$team[i]=="UW") {
    sumUW = sumUW + data$score[i]
    plot(data$time[i], sumUW, type='l')
  }
}


# Task 2: 'guess my number' game

# choose random number 
num <- sample(1:100,1,replace=FALSE,prob=NULL)

# play game
cat("I'm thinking of a number 1-100...")
guess <- readline(prompt = "Guess: ")

while (TRUE) {
  if (guess == num) {
    return(cat("Correct!\n"))
  }
  else if (guess > num) {
    cat("Lower\n")
    guess <- readline(prompt = "Guess: ")
  }
  else if (guess < num) {
    cat("Higher\n")
    guess <- readline(prompt = "Guess: ")
  }
}


# Samantha Masca
# BIOS 30318
# Exercise 8
# TA: Elizabeth Brooks    

# Task 1: generate a graph of the UW vs MSU game from 1/22/2013 

# To do:
# 1-load data
# 2-set variables
# 3-make new matrix of data
# 4-plot data on graph

# load data
setwd("/Users/samanthamasca/Biocomputing2020_Tutorial10/")
data <- read.table(file="UWvMSU_1-22-13.txt",header = TRUE, stringsAsFactors = FALSE)

# set variables 
sumUW <- 0
sumMSU <- 0
M <- matrix(0,nrow=3,ncol=0)

# upload data into new matrix (time, cumulative UW score, cumulative MSU score)
for (i in 1:nrow(data)) {
  if (data$team[i]=="UW") {
    sumUW = sumUW + data$score[i]
  }
  else {
    sumMSU = sumMSU + data$score[i]
  }
  M <- cbind(M, c(data$time[i],sumUW,sumMSU))  
}
rownames(M) <- c("Time", "UW", "MSU")

# plot the graph 
plot(M[1,],M[2,],type = 'l', xlab="Time", ylab="Score", col="red") # UW score = red line
lines(M[1,],M[3,],col="green") # MSU score = green line

############################################################

# Task 2: 'guess my number' game

# To do:
# 1-choose random number 
# 2-play game (by using conditional while loop)

num <- sample(1:100,1,replace=FALSE,prob=NULL)
cat("I'm thinking of a number 1-100...")
while (TRUE) {
  guess <- readline(prompt = "Guess: ")
  if (guess == num) {
    return(cat("Correct!\n"))
  }
  else if (guess > num) {
    cat("Lower\n")
  }
  else if (guess < num) {
    cat("Higher\n")
  }
}
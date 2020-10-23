# Samantha Masca
# BIOS 30318
# Exercise 8
# TA: Elizabeth Brooks    

# Task 1: generate a graph of the UW vs MSU game from 1/22/2013 

# load data
setwd("/Users/samanthamasca/Biocomputing2020_Tutorial10/")
data <- read.table(file="UWvMSU_1-22-13.txt",header = TRUE, stringsAsFactors = FALSE)

# set variables 
sumUW <- 0
sumMSU <- 0
M <- matrix(0,nrow=3,ncol=0)

# upload data into new matrix, M (data includes time, cumulative UW score, cumulative MSU score)
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

# choose random number 
num <- sample(1:100,1,replace=FALSE,prob=NULL)

# set variables 
cat("I'm thinking of a number 1-100...")
i <- 0
guess <- 0

# play the game
while (guess != num) {
  guess <- readline(prompt = "Guess: ")
  if (i < 9) {
    if (guess == num) {
      return(cat("Correct!\n"))
    }
    else if (guess > num) {
      i <- i+1
      cat("Lower\n")
    }
    else if (guess < num) {
      i <- i+1
      cat("Higher\n")
    }
  }
  # if player uses all 10 tries, exit game
  else if (i > 8) {
    cat("Sorry, no more tries!")
    break
  }
}



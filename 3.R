setwd("C:\Users\shikhagarg.CORP\Downloads\dyd\trainfiles")
library(dplyr)
trn <- read.csv("train.csv")
intrn <- read.csv("Internship.csv")
stud <- read.csv("Student.csv")

trn <- left_join(trn,intrn)
trn <- left_join(trn, stud)

dim(trn)

apply(trn, 2, function(x) sum(is.na(x)))

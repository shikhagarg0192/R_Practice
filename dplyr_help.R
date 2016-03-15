library(dplyr)
chicago <- readRDS("chicago_data/chicago.RDS")
dim(chicago)
str(chicago)
names(chicago)[1:8]
head(chicago)
sub <- select(chicago, city:date)
head(sub)

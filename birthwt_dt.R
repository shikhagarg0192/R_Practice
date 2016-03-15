library(rpart)
library(MASS)
library(rattle)
library(rpart.plot)

data("birthwt")
row.names(birthwt) <- NULL
bw <- birthwt
hist(bw$bwt)
table(bw$low)
cols <- c('low', 'race', 'smoke', 'ht', 'ui')
bw[cols] <- lapply(bw[cols], as.factor)

set.seed(111)
ind <- sample(2, nrow(bw), replace = TRUE, prob=c(0.7,0.3))
train_data <- bw[ind==1,]
test_data <- bw[ind==2,]

bwtree <- rpart(low ~ .-bwt, data = train_data, method= "class")

plot(bwtree)
text(bwtree, pretty = 0)

fancyRpartPlot(bwtree, uniform=TRUE, main = "Pruned tree")


summary(bwtree)


#prediction on test data

bwtest <- predict(bwtree, test_data, type="class")
table(bwtest, test_data$low)


#70% accurate
printcp(bwtree)
plotcp(bwtree)

pbwtree <- prune(bwtree, cp= bwtree$cptable[which.min(bwtree$cptable[,"xerror"]),"CP"])

fancyRpartPlot(pbwtree, uniform=TRUE, main = "Pruned tree")

pbwtest <- predict(pbwtree, test_data, type="class")
table(pbwtest, test_data$low)

#74% accurate now. cool......:)

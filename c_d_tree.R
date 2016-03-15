install.packages("C50")
library(C50)
data(churn)

read.table("Churn.xls",header= TRUE)

str(churnTrain)

churnTrain = churnTrain[,!names(churnTrain) %in% c("state","area_code","account_length")]

set.seed(2)
ind = sample(2, nrow(churnTrain), replace = T, prob = c(0.7,0.3))
trainset = churnTrain[ind==1,]
testset = churnTrain[ind==2,]
dim(trainset)
dim(testset)

library(rpart)
library(party)
library(caret)

churntree = rpart(churn~., data=trainset)
churnctree = ctree(churn~., data=trainset)
churntree
churnctree
printcp(churntree)
plotcp(churntree)
printcp(churnctree)
plotcp(churnctree)


#par(mfrow=c(1,1))
plot(churntree, margin = 0.1, uniform = T, branch=0.7)
text(churntree, all= T, use= T)

predictn = predict(churntree, testset, type = "class")
t = table(testset$churn, predictn)

a = (t[1]+t[4])/sum(t)
print(paste0("accurate : ",round(a*100,digits = 2), "%"))
confusionMatrix(table(testset$churn, predictn))

plot(churnctree)

predictn2 = predict(churnctree, testset)
t2 = table(testset$churn, predictn2)

a2 = (t2[1]+t2[4])/sum(t2)
print(paste0("accurate : ",round(a2*100,digits = 2), "%"))
confusionMatrix(table(testset$churn, predictn2))


cp_val = churntree$cptable[which.min(churntree$cptable[,"xerror"]),"CP"]
prune_tree = prune(churntree, cp = cp_val)
plot(prune_tree, margin = 0.1, uniform = T, branch = 0.7)
text(prune_tree, all=T, use.n=T)



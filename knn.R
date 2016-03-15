install.packages("class")
library(class)

levels(trainset$international_plan) = list("0"="no","1"="yes")
levels(trainset$voice_mail_plan) = list("0"="no","1"="yes")
levels(testset$international_plan) = list("0"="no","1"="yes")
levels(testset$voice_mail_plan) = list("0"="no","1"="yes")
head(trainset)
head(testset)
knn_test = knn(trainset[,!names(trainset) %in% c("churn")],testset[,!names(testset) %in% c("churn")] , trainset$churn, k = 3)

dim(trainset)

dim(testset)
#args(knn)
summary(knn_test)
t = table(testset$churn, knn_test)
(t[1]+t[4])/sum(t)


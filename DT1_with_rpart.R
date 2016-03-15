library(rpart.plot)
library(rpart)
data("CO2")
t <- CO2
dim(t)
attributes(t)
set.seed(111)
ind <- sample(2, nrow(t), replace=TRUE, prob=c(0.7,0.3))
train_data <- t[ind==1,]
test_data <- t[ind==2,]

formula <- conc ~ Plant + Type + Treatment + uptake
my_pred <- rpart(formula, data = train_data, control=rpart.control(minsplit = 10))
attributes(my_pred)
plot(my_pred)
text(my_pred,use.n = T)

opt <- which.min(my_pred$cptable[,"xerror"])


cp <- my_pred$cptable[opt, "CP"]
t_prune <- prune(my_pred,cp=cp)
plot(t_prune)
text(t_prune)

test_predc <- predict(t_prune, newdata = test_data)
xlim <- levels(t$conc)
plot(test_predc ~ conc, data = test_data, xlab = "Observed", ylab = "Predicted", ylim = xlim, xlim = xlim)

abline(a=0,b=1)


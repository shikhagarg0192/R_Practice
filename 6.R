str(SLID)
boxplot(SLID$education~SLID$sex)

plot(SLID$wages~SLID$education)
plot(SLID$wages~SLID$sex)
plot(SLID$wages~SLID$age)
plot(SLID$wages~SLID$language)


plot(SLID$education,SLID$age)

apply(SLID[,c("education","age")], 2, function(x)if(!is.na(x))cor(x))

library(caret)

library(MASS)

par(mfrow=c(2,2))
plot(SLID)

lmfit <- lm(wages~., data=SLID)
summary(lmfit)

lmfit <- lm(log(wages) ~ education + age + sex, data = SLID)
summary(lmfit)
plot(lmfit)
vif(lmfit)
sqrt(vif(lmfit)) >2 

library(lmtest)
bptest(lmfit)

library(rms)

olsfit <- ols(log(wages) ~ education + age + sex, data= SLID, x= T, y= T)
robcov(olsfit)

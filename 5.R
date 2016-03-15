library(car)
require(car)
library(MASS)
data("Quartet")

str(Quartet)

plot(Quartet$x,Quartet$y1)
lmfit <- lsfit(Quartet$x, Quartet$y1)
abline(lmfit, col = "red")

lmfit <- lm(y1~x, Quartet)
abline(lmfit, col = "red")
lmfit
summary(lmfit)
influence(lmfit)

newd <- data.frame(x = c(1,2,3,4))
predict(lmfit, newd, interval = "confidence", level = 0.95)
predict(lmfit, newd, interval = "predict")
#diagnostic plot

par(mfrow = c(2,2))
plot(lmfit)

Quartet[c(9,3,10), 1:2]
d1<-cooks.distance(lmfit)
r <- stdres(lmfit)
a <- cbind(Quartet,d1,r)

a[d1>=(4/11),]



plot(cooks.distance(lmfit))

plot(Quartet$x, Quartet$y2)
lmfit <- lm(Quartet$y2~poly(Quartet$x,2))
lines(sort(Quartet$x), lmfit$fit[order(Quartet$x)],col="blue")

predict(lmfit, newd, interval="confidence", level = 0.95)
lmfit <- lm(Quartet$y2~I(Quartet$x)+I(Quartet$x^2))


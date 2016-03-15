sample(1:10)
sample(1:10, size = 5)
sample(c(0,1),10,  replace = TRUE)
sample.int(20,12)
library(stats)
dnorm(0)
dnorm(0,mean = 10,sd=2)
curve(dnorm, -3,3)

pnorm(1.5)
pnorm(1.5, lower.tail = FALSE)
curve(pnorm, -3,3)
pnorm(-1.5)

qnorm(0.5)

rnorm(10, mean=3,sd=10)
runif(10,0,5)

hist(runif(10,1,5))

data("AirPassengers")
AirPassengers
names(AirPassengers)
names(airquality)
airquality


sum(is.na(airquality$Temp))
stem(airquality$Wind)
class(airquality)
str(airquality)


a <- c(1.4,2.5,4.6,1.6,1.3)
class(a)
stem(a)
library(ggplot2)
qplot(airquality$Wind, b)




mode(airquality$Temp)

mode

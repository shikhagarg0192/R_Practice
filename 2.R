x <- runif(100, min = 1, max = 50)
y <- runif(100, min = 1, max = 50)
t.test(x,y)
ks.test(x,y)
wilcox.test(x,y)


x <- c(1,2,3,4,5)
y <- c(1,2,3,4,5)
t.test(x~y)




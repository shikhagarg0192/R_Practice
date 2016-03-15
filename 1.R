
data(iris)
set.seed(2)
smp <- list()
sample(c(1,2),size = 10,replace=TRUE)

nrow(iris)

View(mtcars)

ftable <- table(mtcars$am, mtcars$gear)
mosaicplot(ftable, main = "chi-test", color = T)

chisq.test(ftable)

x <- factor(x = c(1,1,2,3,2,1,1,3), levels = c(1,2,3))
y <- factor(x = c("a","b","a","b"), levels = c("a","b"))
f <- table(x,y)
chisq.test(f)

f <- table(mtcars$cyl, mtcars$vs)
chisq.test(f)

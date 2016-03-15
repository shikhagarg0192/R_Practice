str(iris)
set.seed(111)
data(iris)
ind <- sample(2,nrow(iris), replace=TRUE, prob=c(0.7,0.3))
train_data <- iris[ind==1,]
test_data <- iris[ind==2,]

library(party)
my_form <- Species~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

iris_ctree <- ctree(my_form, data = train_data)

table(predict(iris_ctree), train_data$Species)

print(iris_ctree)
plot(iris_ctree)

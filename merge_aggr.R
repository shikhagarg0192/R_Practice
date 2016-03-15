save(iris, file = "mydata.RData")
load("mydata.RData")


ist <- read.table(header = TRUE, text = "
a	b
1	1.5
2	2.5
3	3.5")

iind <- read.table(header = TRUE, text = "
a	c
1	4.2
2	1.1")

merge(ist, iind , all.x = TRUE)



aggregate(iris[,1:4], by = list(iris$Species), FUN = sum)

cast(data = iris.melt, Species~variable, mean, subset = Species %in% c("setosa", "versicolor"), margins = 'grand_row')
#grand_row will repeat the row

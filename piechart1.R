x <- c(21,32,41,39)
labels <- c("a","b","c","d")
png(file = "pie1.jpg")

pie(x, labels, main = "pie1", col= rainbow(length(x)))

dev.off()
file.show("pie1.jpg")
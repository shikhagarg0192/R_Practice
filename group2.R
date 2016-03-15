library(RMySQL)
library(dplyr)
library(plyr)
library(sqldf)
con <- dbConnect(MySQL(), user = "root", password = "root", host = "localhost", client.flag=CLIENT_MULTI_RESULTS)

sql <- "select * from emp.test1"
rows <- dbGetQuery(con,sql)

final <- ddply(rows,.(user1,activity),summarise,pageurl = paste(pageurl, collapse = ", "))

print(final)

library(gdata)
library(plyr)
library(dplyr)
df1 <- read.xls("Tab_Villages.xlsx", sheet= 1, header = T, perl = "C:\\Perl64\\bin\\perl.exe")
df2 <- read.xls("Tab_Villages.xlsx", sheet= 2, header = T, perl = "C:\\Perl64\\bin\\perl.exe")

str(df1)
df1$Survey.Date <- as.Date(df1$Survey.Date)
str(df2)
df2$Survey.Start.Date <- as.Date(df2$Survey.Start.Date, format = "%d-%b-%Y")
df2$Survey.End.Date <- as.Date(df2$Survey.End.Date, format = "%d-%b-%Y")

head(df1)
head(df2)

View(df1)
View(df2)

df1$Survey.Date_ind = ifelse(df1$Survey.Date >= df2$Survey.Start.Date & df1$Survey.Date <= df2$Survey.End.Date,1,0 )

library(sqldf)
d <- sqldf('select df1."Response.No", df1."Tab.No", df1."Survey.Date", df2."Survey.Start.Date",
        df2."Survey.End.Date",df2."AC.Name", df2."Mandal.Name", df2."Village.Name" 
        from df1 inner join df2 on df1."Tab.No" = df2."Tab.No"
        where df1."Survey.Date"<= df2."Survey.End.Date" and df1."Survey.Date" >= df2."Survey.Start.Date"')


nrow(d[d$Tab.No==35,])


d[]


NROW(d)
#View(d[d$Response.No == 206,])

names(df2)
nrow(d)
length(unique(d$Response.No))
names(d)

c <- NULL
c <- data.frame(Response.No = d$Response.No)
c$Tab.No <- d$Tab.No
c$AC.Name <- d$AC.Name
c$Mandal.Name <- d$Mandal.Name
c$Village.Name <- d$Village.Name
c$Survey.Date <- d$Survey.Date
c$Survey.Start.Date<- d$Survey.Start.Date
c$Survey.End.Date<-d$Survey.End.Date

View(d)
 
nrow(c)
sum(duplicated(c))
c[duplicated(c)]
c<- c[!duplicated(c),]

c[c$Response.No == 7843 & c$Tab.No== 34,]




View(head(c))

length(duplicated(d[,1:2]))

d[duplicated(d$Response.No),"Response.No"]


df_d <- df1
df_d$AC.Name <- d$AC.Name[d$Tab.No == df_d$Tab.No & d$Response.No == df_d$Response.No]
View(df_d)






# apply(df_d,2, function(x){
#     for(i in 1:nrow(d)){
#         if(d[i,"Tab.No"]==x$Tab.No & d[i,"Response.No"] == x$Response.No){
#             x$AC.Name <- d[i, "AC.Name"]
#             }
#         }
#     }
#     )
# 



# df_join <- left_join(df1,df2,"Tab.No")
# head(df_join)
# str(df_join)
# df_join$Village.Name.x <- ifelse(df_join$Survey.Date > df_join$Survey.Start.Date & 
#                                      df_join$Survey.Date < df_join$Survey.End.Date, df_join$Village.Name.y, 'No idea')
# 
# df_join$Mandal.Name.x <- ifelse(df_join$Survey.Date > df_join$Survey.Start.Date & 
#                                      df_join$Survey.Date < df_join$Survey.End.Date, df_join$Mandal.Name.y, 'No idea')
# 
# df_join$AC.Name.x <- ifelse(df_join$Survey.Date > df_join$Survey.Start.Date & 
#                                      df_join$Survey.Date < df_join$Survey.End.Date, df_join$AC.Name.y, 'No idea')
# 
# 
# factor(df_join$Village.Name.y)

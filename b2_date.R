library(qdapRegex)
library(gdata)
library(dplyr)
library(stringr)
df <- read.xls("b2.xlsx", header = T, perl = "C:\\Perl64\\bin\\perl.exe")
head(df)
#  id                                                     text
#1  1                               My birthdate is 01-01-1992
#2  2                                         I am shikha Garg
#3  3 dates are 02-12-1994,hello  04-09-2013, world 01-01-1998
#4  4               your birthdate is 01-01-1995 or 01-02-1995
#5  5                                            hello world!!

df<- df %>%
mutate(date_sep = rm_default(text, pattern = "[0|1|2][0-9]-[0|1][0-9]-[0-9]{4}", extract = TRUE)) %>%
mutate(maxdate = lapply(date_sep,max))

out <- strsplit(as.character(df$date_sep),', ')
out <- str_split_fixed(df$date_sep,', ',2)
out[[3]][1]
rbind(out)

class(unlist(df$date_sep[3]))




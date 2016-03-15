data("Orange")
org <- tbl_df(Orange)

org %>%
    filter(age > 500) %>%
    group_by(Tree) %>%
    summarise(mean(circumference))
    

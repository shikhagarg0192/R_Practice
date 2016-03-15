mode <- function(x){
    temp <- table(x)
    names(temp)[temp==max(temp)]
}

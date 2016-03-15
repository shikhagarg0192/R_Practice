f <- function(n){
    for(i in seq_len(n))cat("hello world")
    
}
f(2)

make.pow <- function(n){
    pow <- function(x){
        x^n
    }
    pow
}
cube <- make.pow(3)
sqr <- make.pow(2)
cube(2)
sqr(2)

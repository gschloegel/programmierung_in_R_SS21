fib <- function(n) {
  if (n == 1 | n == 2) {
    return(1)
  }
  else {
    return(fib(n-1) + fib(n-2))
  }
}

sapply(1:8, fib)
# alternatively use while loop

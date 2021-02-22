# a)
vecnorm <- function(v) {
  return((drop(v %*% v))^(1/2))
}

vecnorm(c(3, 4))

# b)
vecdist <- function(P, Q = 0) {
  return(vecnorm(P - Q))
}

vecdist(c(3,4))
vecdist(c(-1,-2), c(2,2))

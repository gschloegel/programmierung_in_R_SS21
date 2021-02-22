# exercise 6
vecnorm <- function(v, norm = 2) {
  return((sum(abs(v^norm)))^(1/norm))
}

vecnorm(c(3, 4), n = 1)

vecdist <- function(P, Q = 0, norm = 2) {
  return(vecnorm(P - Q, norm))
}

vecdist(c(3,4), norm = 1)
vecdist(c(-1,-2), c(2,2), norm =1)
vecdist(c(-1,-2), c(2,2))

# exercise 7
addresses <- matrix(c(83,12,50,93,99,79,14,15,70,1,32,68,6,59,87,54,50,86,82,62,9,19,57,88,99), nrow = 5, byrow = T)

# lots of loops, maybe it is possible to use matrix functions

total_distance <- function(adresses, x, y) {
  sum = 0
  for (i in 1:5) {
    for (j in 1:5) {
      sum = sum + adresses[i,j] * vecdist(c(i,j),c(x,y),norm=1)
    }
  }
  return(sum)
}

distances <- matrix(nrow = 5, ncol = 5)

for (i in 1:5) {
  for (j in 1:5) {
    distances[i,j] <- total_distance(addresses, i, j)
  }
}

distances
min(distances)
which(distances == min(distances), arr.ind = TRUE)

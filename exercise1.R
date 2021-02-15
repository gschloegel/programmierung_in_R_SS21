# Aufgabe 1
# a)
n <- 100
n <- 1000
x1 <- sum(c(1:n)^3)
x2 <- (sum(c(1:n)))^2
x1
x2
x2 == x2
# b)
v = c(1:100)
v2 = (v^(1/2))^2
all(v == v2)
all.equal(v, v2)


# Aufgabe 2
# a)
v <- runif(100, min = 1, max = 10)
# b)
max(v)
which.max(v)
# c)
vtop <- sort(v, decreasing = T)[1:10]
vtop
# d)
sum(v > 5)
# e)
v_round <- round(v)
sum(v_round == 1)


# Aufgabe 3
# a)
x2 <- cbind(c(1:10)^2)
y2 <- rbind(c(1:10)^2)
sum (x2 %*% y2 >= 50) /10^2  # events / possible outcomes
# b)
n <- 100000
sum(runif(n)^2 + runif(n)^2 >= 1) / n
# exakte Lösung
1 - pi / 4
# c)
n <- 100000
sum(rnorm(n)^2 + runif(n)^2 >= 1) / n


# Aufgabe 4
# a)
v <- c(1, 2, 3)
w <- c(2, -3, -4)
norm_v <- drop(v %*% v)^(1/2)
norm_w <- drop(w %*% w)^(1/2)
norm_v
norm_w
sproduct <- drop(v %*% w)
sproduct
phi <- acos(sproduct / (norm_v * norm_w))
phi
# b)
M = matrix(runif(4, min = -1, max = 1), nrow = 2)
# Winkel zwischen der 1. und 2. Zeile
acos(drop(M[,1] %*% M[,2]) / (drop(M[,1] %*% M[,1])^(1/2) * drop(M[,2] %*% M[,2])^(1/2)))
# Winkel zwischen der 1. und 2. Spalte
acos(drop(M[1,] %*% M[2,]) / (drop(M[1,] %*% M[1,])^(1/2) * drop(M[2,] %*% M[2,])^(1/2)))


#Aufgabe 5
t <- 100
n <- 10000
M <- matrix(sample(c(-1, 1), t*n, replace = T), nrow = n)
# 1 row per experiment
x <- apply(M, 1, sum)
sum(x <= 10 & x >= -10) / n

  
            
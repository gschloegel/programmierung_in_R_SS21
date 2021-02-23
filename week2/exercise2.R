# a)
N <- function(t) {
  return (2500 / (1 + 9 * exp(-t/3)))
}

x = 1:20
plot(x,N(x))
#one idea of improving the layout of the plot
#there are several options for the argument type
#https://www.dummies.com/programming/r/how-to-create-different-plot-types-in-r/
plot(x,N(x),
     main = "Bacterial Growth",
     xlab = "time [min]",
     ylab = "bacterial count",
     type = "b")
# c)
# exp(-t/3) -> 0
# N(t) -> 2500

# d)
t <- function(N) {
  t <- (-3) * log(((2500/N) -1)/9)
  return(t)
}
t(1000)

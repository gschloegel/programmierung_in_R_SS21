library(ggplot2)
library(car)

data <- read.csv('BloodConcentration.csv')
summary(data)

# a)

model <- nls(y ~ a * exp(b * t), data, start = list(a = 1, b = 0))
summary(model)

(ggplot(data, aes(x = t, y = y)) + geom_point() 
  + geom_smooth(method = 'nls', method.args = list(start = list(a = 1, b = 0)),
                formula = 'y ~ a * exp(b * x)', se = F, fullrange = T)
  + xlim(0, 4))

# b)

y0 <- predict(model, data.frame(t = 0))
y0

# c)

# in this case it can be easily calculated manually
# target: exp(b * t) = 1/2
# t = -ln(2) / b
-log(2) / -1.51392

# let R search for the root
f <- function(t1) {
  predict(model, data.frame(t = t1)) - y0 / 2
}


uniroot(f, c(0,1))$root


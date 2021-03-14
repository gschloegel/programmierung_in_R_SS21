library(plotly)
library(car)

data <- read.csv('ProcessYield.csv')
summary(data)

# a)
model <- nls(Y ~ a * T^b + p^c, data, start = list(a = 1, b = 1, c = 1))
summary(model)

# b)

predict(model, data.frame(T = 5, p = 5))

# c)

predict(model, data.frame(T = 110, p = 50))

# d)

plot_ly(data = data, x = ~ T, y = ~ p, z = ~ Y, type = "scatter3d", mode = "markers")

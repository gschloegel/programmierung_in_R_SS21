library(ggplot2)
library(car)
library(mgcv)

data <- read.csv('GAGurine.csv')
summary(data)

# a)

(ggplot(data, aes(x = Age, y = GAG)) + geom_point()
  + geom_smooth(method = lm, formula = y ~ x, se = F)
  + geom_smooth(method = gam, formula = y ~ s(x, bs = 'cr'), color = 'red', se = F))

# b)

model <- gam(GAG ~ s(Age, bs = 'cr'), data = data, family = gaussian)
summary(model)

# c)
predict(model, data.frame(Age = c(2,10)))

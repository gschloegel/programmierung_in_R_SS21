library(ggplot2)
library(car)
library(mgcv)

data <- read.csv('BirthWeight.csv')
summary(data)

# a)

(ggplot(data, aes(x = MAGER, y = DBWT)) + geom_point()
  + geom_smooth(method = lm, formula = y ~ x, se = F)
  + geom_smooth(method = gam, formula = y ~ s(x, bs='cr'), se = F, color = "red"))

# b)

(ggplot(data, aes(x = PWGT, y = DBWT)) + geom_point()
  + geom_smooth(method = lm, formula = y ~ x, se = F)
  + geom_smooth(method = gam, formula = y ~ s(x, bs='cr'), se = F, color = "red"))

# c)

model <- gam(DBWT~ s(MAGER, bs = 'cr'), data =  data, family = gaussian)
summary(model)

# d)

predict(model, data.frame(MAGER = 30))

# e)

model2 <- gam(DBWT~ s(MAGER, bs = 'cr') + s(PWGT, bs = 'cr'), data =  data, family = gaussian)
summary(model2)

# f)

predict(model2, data.frame(MAGER = 30, PWGT = 64))

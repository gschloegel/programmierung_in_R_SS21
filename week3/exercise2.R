library(ggplot2)

# a)
data <- read.csv("Iris.csv")

# b)
str(data)

# c)
table(data$Species)

# d)
ggplot(data,mapping=aes(x=Sepal.Length,y=Sepal.Width,col=Species)) +
  geom_point()

# e)
aggregate(Sepal.Length ~ Species, data, mean)

# f)
with(data, boxplot(Sepal.Length ~ Species, xlab="Spezies"))
ggplot(data, aes(x=Species, y=Sepal.Length)) + geom_boxplot()


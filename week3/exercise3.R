library(ggplot2)

# a)
data <- read.csv("Breslow.csv")

# b)
length(data$X)

# c)
mean(data$Age)

# d)
hist(data$Base)
ggplot(data, aes(x=Base)) + geom_histogram()

# e)
mean(subset(data, Trt == "progabide")$Ysum)

# f)
ggplot(data, aes(y=Ysum, x=Trt)) + geom_boxplot()


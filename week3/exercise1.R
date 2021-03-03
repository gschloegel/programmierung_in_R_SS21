library(ggplot2)

# a)
data <- read.csv("Weight.csv")

# b)
data$Height <- data$Height * 2.54

# c)
data$Weight <- data$Weight * 0.45

# d)
mean(subset(data, Gender == "Male")$Height)
mean(subset(data, Gender == "Female")$Height)

aggregate(Height ~ Gender, data, mean)

# e)
data$BMI <- round(data$Weight / (data$Height / 100)^2, digits = 1)
# rounding results before classification is a bad idea

# f)
data$BMI_class <- cut(data$BMI, breaks = c(0, 18.5, 25, 30, Inf),
                      labels = c("Untergewicht", "Normal", "Übergewicht", "Obese"), ordered_result = T)

# g)
# keep the classes described above
hist(data$BMI, breaks = c(min(data$BMI), 18.5, 25, 30, max(data$BMI)))
barplot(table(data$BMI_class))

# histograms with standard classes
hist(data$BMI)
ggplot(data, aes(x=BMI)) + geom_histogram()

# h)
aggregate(BMI~Gender+BMI_class, data, mean)

# i)
ggplot(data,mapping=aes(x=Height,y=Weight,col=BMI_class)) +
  geom_point()

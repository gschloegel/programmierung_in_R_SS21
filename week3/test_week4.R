library(ggplot2)

data <- read.csv("NHANES_3.csv")
data$BMI <- round(data$Weight / (data$Height / 100)^2, digits = 2)
data$BMI <- data$Weight / (data$Height / 100)^2
data$overweight <- (data$BMI >= 25)

summary(data)

ggplot(data,mapping=aes(x=Sex,y=Weight)) + geom_boxplot()
ggplot(data,mapping=aes(x=BMI)) + geom_histogram()
ggplot(data,mapping=aes(x=Age,y=BMI,col=Sex)) + geom_point()

data.overweight <- subset(data, overweight == T)
length(data.overweight$overweight) / length(data$overweight) * 100

# length(subset(data, overweight == T & Age >=65)$Sex) / length(subset(data,Age >=65)$Sex) *100
length(subset(data, overweight == T & Age >=65 & Sex == "male")$Sex)/ length(subset(data,Age >=65 & Sex == "male")$Sex) *100

data <- read.csv("NHANES_9.csv")

data$age.group <- cut(data$Age, breaks = c(0, 17.5, 64.5, Inf), 
                      labels = c("jung", "mittel", "alt"),  ordered_result = T)
ggplot(data,mapping=aes(x=age.group,y=BP)) + geom_boxplot()
ggplot(data,mapping=aes(x=Age,y=BP,col=Sex)) + geom_point()

median(subset(data, age.group == "mittel"& Sex == "female")$BP)
median(subset(data, age.group == "mittel"& Sex == "male")$BP)


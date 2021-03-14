library(ggplot2)
library(car)

patients = read.csv('IschemicHeartDisease.csv')
summary(patients)

# a)

ggplot(patients, aes(x = Age, y = Cost)) + geom_point()

# b)

model <- lm(Cost ~ Age + Sex + ERVisits + Interventions + Comorbidities, patients)
summary(model)

# delete the non significant variables (alpha = 0,05)

model2 <- lm(Cost ~ Age + Sex + ERVisits + Interventions, patients)
summary(model2)

model3 <- lm(Cost ~ Sex + ERVisits + Interventions, patients)
summary(model3)

# c)

# Multiple R-squared:  0.5452,	Adjusted R-squared:  0.5435

# d)

Anova(model3, type = 2)


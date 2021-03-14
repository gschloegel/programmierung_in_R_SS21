library(car)

# a)

patients = read.csv("Insurance.csv")
summary(patients)

model <- lm(charges ~ age + sex + bmi + smoker, patients)
summary(model)

model2 <- lm(charges ~ age + bmi + smoker, patients)
summary(model2)

# b)

anova(model2)
a <- Anova(model2, type = 2)
a$percent <- a$`Sum Sq` / sum(a$`Sum Sq`) *100
a

# c)

# patients$age
# patients$smokeryes  23823.68

# d)

# there should be an easier way to do it?
bmi20 <- mean(patients[patients$age == 20,]$bmi)
bmi50 <- mean(patients[patients$age == 50,]$bmi)

x <- data.frame(age = 20, smoker = 'no', bmi=bmi20)
y <- data.frame(smoker = 'yes', age = 50, bmi = bmi50)

predict(model2, x)
predict(model2, y)

# alternative solution, create model to predict bmi at certain age

model.bmi <- lm(bmi ~ age, patients)
predict(model2, data.frame(age = 20, smoker = 'no', bmi = predict(model.bmi, data.frame(age = 20))))
predict(model2, data.frame(age = 50, smoker = 'yes', bmi = predict(model.bmi, data.frame(age = 50))))

# solution 3 create model without bmi
model3 <- lm(charges ~ age + smoker, patients)
predict(model3, data.frame(age = 20, smoker = 'no'))
predict(model3, data.frame(age = 50, smoker = 'yes'))

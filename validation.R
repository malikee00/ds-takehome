install.packages("glmtoolbox")

library(glmtoolbox)
library(ggplot2)
library(dplyr)

df <- read.csv("C:/Users/kamil/ds-takehome/data/credit_scoring.csv", sep=";")

names(df)

# Fit model logistic
model <- glm(default ~ credit_score + loan_amount + monthly_income + age,
             family = binomial, data = df)

model
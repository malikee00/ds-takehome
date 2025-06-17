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

# Hosmer-Lemeshow test
hltest(model, g = 10) # g = 10 grup probabilitas

df$predicted <- predict(model, type = "response")
df$bin <- ntile(df$predicted, 10)

calib <- df %>%
  group_by(bin) %>%
  summarise(
    avg_pred = mean(predicted),
    actual = mean(default)
  )

# Plot calibration curve
ggplot(calib, aes(x = avg_pred, y = actual)) +
  geom_line(color = "blue") +
  geom_abline(linetype = "dashed") +
  labs(title = "Calibration Curve", x = "Predicted Probability", y = "Actual Default Rate") +
  theme_minimal()

ggsave("C:/Users/kamil/ds-takehome/calibration_curve.png", dpi = 300)


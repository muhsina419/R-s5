# --- Load Necessary Libraries ---
library(ggplot2)
library(corrplot)
library(dplyr)

# --- Load the Dataset ---
# Update the path if needed
boston <- read.csv("/home/cusat/Downloads/boston/BostonHousing.csv")

# --- Data Exploration and Visualization ---

cat("Structure of dataset:\n")
str(boston)

cat("\nSummary of dataset:\n")
summary(boston)

# Check for missing values
cat("\nNumber of missing values:\n")
print(sum(is.na(boston)))

# --- Correlation Matrix Plot ---
# Exclude the categorical target 'CAT..MEDV' for numeric correlation
corr_matrix <- cor(boston[, sapply(boston, is.numeric)])
corrplot(corr_matrix, method = "color", tl.cex = 0.7, main = "Correlation Matrix")

# --- Boxplot of the Target Variable (CAT..MEDV) ---
ggplot(boston, aes(y = as.factor(CAT..MEDV))) + 
  geom_boxplot(fill = "lightblue") + 
  ggtitle("Boxplot of Categorical Median Value (CAT..MEDV)") +
  ylab("CAT..MEDV (0 = Low, 1 = High)")

# --- Regression Analysis ---
# Fit a linear regression model predicting CAT..MEDV
model <- lm(CAT..MEDV ~ ., data = boston)

cat("\nRegression Model Summary:\n")
print(summary(model))

# --- Diagnostic Plots ---
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))  # Reset plot layout

# --- Prediction ---
# Predict median home value category using the fitted model
predicted_CAT <- predict(model, newdata = boston)

cat("\nFirst few predicted values:\n")
print(head(predicted_CAT))

# --- Actual vs Predicted Plot ---
ggplot(boston, aes(x = CAT..MEDV, y = predicted_CAT)) +
  geom_point(color = "blue") +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  ggtitle("Actual vs Predicted Categorical Median Home Values") +
  xlab("Actual CAT..MEDV") +
  ylab("Predicted CAT..MEDV")


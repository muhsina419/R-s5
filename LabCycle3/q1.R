house_data <- read.csv("Q1 train.csv")

head(house_data)

data <- house_data[, c("GrLivArea", "SalePrice")]
colnames(data) <- c("size", "price")
summary(data)

model <- lm(price ~ size, data = data)
summary(model)

coefficients <- coef(model)
intercept <- coefficients[1]
slope <- coefficients[2]

cat("Intercept: ", intercept, "\n")
cat("Slope: ", slope, "\n")

plot(house_data$GrLivArea, house_data$SalePrice,
     main = " House Price vs Size ",
     xlab = "Size ( Square Feet ) ",
     ylab = "Sale Price ($) ",
     pch = 19, cex = 0.7, col = "maroon")

abline(model, col = "salmon", lwd = 2)

legend("topleft", legend = c("Actual data points", "Regression model line"),
       col = c("maroon", "salmon"),
       lty = c(NA, 1),
       pch = c(19, NA),
       bty = "n")c:\Users\muhsi\Downloads\c3q1.1 (1).png
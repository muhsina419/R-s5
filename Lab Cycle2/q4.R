# Load data
data(mtcars)

# Calculate mean and standard deviation
mpg_mean <- mean(mtcars$mpg)
mpg_sd <- sd(mtcars$mpg)

# Define histogram breaks
breaks <- seq(floor(min(mtcars$mpg)), ceiling(max(mtcars$mpg)), by = 2)

# Compute histogram data (without plotting)
hist_data <- hist(mtcars$mpg, breaks = breaks, plot = FALSE)

# Create color palette
colors <- colorRampPalette(c("lightblue", "blue", "darkblue"))(length(hist_data$counts))

# --- SAVE PLOT TO IMAGE FILE ---
png("mtcars_histogram.png", width = 800, height = 600)

# Plot histogram
hist(mtcars$mpg, breaks = breaks, col = colors, border = "black",
     main = "Histogram of Miles per Gallon (mpg) in mtcars",
     xlab = "Miles per Gallon (mpg)",
     ylab = "Frequency")

# Add lines for mean and ±SD
abline(v = mpg_mean, col = "red", lwd = 2, lty = 2)
abline(v = mpg_mean + mpg_sd, col = "darkgreen", lwd = 2, lty = 3)
abline(v = mpg_mean - mpg_sd, col = "darkgreen", lwd = 2, lty = 3)

# Add legend
legend("topright",
       legend = c(paste("Mean =", round(mpg_mean, 2)),
                  paste("SD =", round(mpg_sd, 2))),
       col = c("red", "darkgreen"),
       lty = c(2, 3),
       lwd = 2)

# Close image device
dev.off()

# Print mean and SD to console
cat("Mean MPG:", mpg_mean, "\n")
cat("Standard Deviation of MPG:", mpg_sd, "\n")

cat("Plot saved as 'mtcars_histogram.png'\n")

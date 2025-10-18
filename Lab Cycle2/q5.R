# Load dataset
data(mtcars)

# Convert 'gear' to factor
mtcars$gear <- as.factor(mtcars$gear)

# Save plot to PNG
png("boxplot_hp_gears.png", width = 800, height = 600)

# Create boxplot
boxplot(hp ~ gear, 
        data = mtcars, 
        main = "Horsepower Distribution by Number of Gears",
        xlab = "Number of Gears",
        ylab = "Horsepower (hp)",
        col = c("lightblue", "lightgreen", "lightpink"),
        border = "darkblue")

# Loop through each gear level to label outliers
for (g in levels(mtcars$gear)) {
  gear_data <- mtcars$hp[mtcars$gear == g]
  outliers <- boxplot.stats(gear_data)$out
  
  if (length(outliers) > 0) {
    outlier_positions <- which(gear_data %in% outliers)
    
    # Convert gear factor to numeric position on x-axis
    x_pos <- as.numeric(g)
    
    text(x = x_pos + 0.1,
         y = outliers,
         labels = rownames(mtcars[mtcars$gear == g, ])[outlier_positions],
         pos = 4,
         cex = 0.8,
         col = "red")
  }
}

# Add legend
legend("topright",
       legend = paste(levels(mtcars$gear), "Gears"),
       fill = c("lightblue", "lightgreen", "lightpink"),
       border = "darkblue",
       title = "Gear Legend")

# Close the graphics device
dev.off()

cat("Plot saved as 'boxplot_hp_gears.png'\n")

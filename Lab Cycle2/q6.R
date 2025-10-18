# Load library
library(ggplot2)

# Load dataset
data(mtcars)

# Convert 'carb' to a factor for coloring
mtcars$carb_factor <- as.factor(mtcars$carb)

# Create plot
p <- ggplot(mtcars, aes(x = wt, y = disp, color = carb_factor, size = carb)) +
  geom_point(alpha = 0.7) +  # Scatter plot
  geom_smooth(aes(x = wt, y = disp), method = "loess", se = TRUE, color = "black", inherit.aes = FALSE) +
  scale_color_brewer(palette = "Set1") +  # Color palette
  scale_size_continuous(range = c(3, 8)) +  # Adjust point size range
  labs(
    title = "Displacement vs Weight in mtcars Dataset",
    x = "Weight (1000 lbs)",
    y = "Displacement (cu.in.)",
    color = "Number of Carburetors",
    size = "Number of Carburetors"
  ) +
  theme_minimal() +
  theme(legend.position = "right")

# Save the plot to an image file
ggsave("mtcars_disp_vs_wt.png", plot = p, width = 8, height = 6, dpi = 300)

cat("Plot saved as 'mtcars_disp_vs_wt.png'\n")

# q1.R
data(mtcars)

colors <- c("maroon", "pink","gold")[as.factor(mtcars$cyl)]

# Open a PNG graphics device
png("mtcars_plot.png", width=800, height=600)

plot(mtcars$disp, mtcars$mpg,
     col = colors,
     pch = 19,
     main = "Relationship between Displacement and MPG in Cars",
     xlab = "Displacement (cu. in.)",
     ylab = "Miles per Gallon (MPG)")

lines(lowess(mtcars$disp, mtcars$mpg), col = "black", lwd = 2)

legend("topright",
       legend = paste(unique(mtcars$cyl), "Cylinders"),
       col = unique(colors),
       pch = 19,
       title = "Number of cylinders")

# Close the graphics device
dev.off()

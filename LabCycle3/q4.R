# Load the dataset
data(mtcars)

# Convert gear to a factor (categorical variable)
mtcars$gear <- as.factor(mtcars$gear)

# Perform one-way ANOVA
anova_result <- aov(disp ~ gear, data = mtcars)

# Display the summary of the ANOVA test
summary(anova_result)



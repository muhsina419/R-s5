data(iris)
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Relationship between Sepal Length and Petal Length in iris dataset",
     xlab = "Sepal length",
     ylab = "Petal length",
     col = "purple",
     pch = 19)

png(filename = "iris_scatterplot.png", width = 2000, height = 1500, res = 300)
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Relationship between Sepal Length and Petal Length in iris dataset",
     xlab = "Sepal length",
     ylab = "Petal length",
     col = "purple",
     pch = 19)

dev.off()
# Load the dataset 
data(mtcars)

# Perform Pearson correlation test
cor_test_result <- cor.test(mtcars$hp, mtcars$mpg, method = "pearson")

print(cor_test_result)
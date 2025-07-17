a <- 10
b <- 20

sum <- a + b
product <- a * b

greet <- function(name) {
  message <- paste("Hello", name, "!")
  return(message)
}

print(paste("Sum:", sum))
print(paste("Product:", product))
print(greet("Muhsina"))


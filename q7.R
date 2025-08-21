generate_twisted_fibonacci <- function(n_terms) {
  if (n_terms <= 0) {
    return(NULL)
  } else if (n_terms == 1) {
    return(c(0))
  } else if (n_terms == 2) {
    return(c(0, 1))
  } else if (n_terms == 3) {
    return(c(0, 1, 1))
  }
  
  # Initial three terms
  series <- c(0, 1, 1)
  
  # Generate remaining terms
  for (i in 4:n_terms) {
    next_term <- sum(series[(i-3):(i-1)])
    series <- c(series, next_term)
  }
  
  return(series)
}

# Get user input
n_input <- as.integer(readline(prompt = "Enter number of terms: "))

# Generate and print the series
result <- generate_twisted_fibonacci(n_input)
cat("Twisted Fibonacci series:\n")
print(result)

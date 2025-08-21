series_sum <- function(n_terms) {
  sum <- 0
  for (n in 1:n_terms) {
    term <- (n / (2 * n - 1)) * (-1)^(n + 1)
    sum <- sum + term
  }
  return(sum)
}

# Get user input
n_input <- as.integer(readline(prompt = "Enter number of terms: "))

# Calculate and print the result
cat("Sum of the series:", series_sum(n_input), "\n")


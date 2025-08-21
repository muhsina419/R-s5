# Function to check if a number is prime
is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  } else if (n == 2) {
    return(TRUE)
  } else {
    for (i in 2:sqrt(n)) {
      if (n %% i == 0) {
        return(FALSE)
      }
    }
    return(TRUE)
  }
}

# Option 1: Check a single number
num <- as.integer(readline(prompt = "Enter a number to check if it is prime: "))
if (is_prime(num)) {
  cat(num, "is a prime number.\n")
} else {
  cat(num, "is not a prime number.\n")
}

# Option 2: Find all prime numbers in a range
cat("\nNow let's find all prime numbers in a given range.\n")
start_range <- as.integer(readline(prompt = "Enter the start of the range: "))
end_range <- as.integer(readline(prompt = "Enter the end of the range: "))

cat("Prime numbers between", start_range, "and", end_range, "are:\n")
for (i in start_range:end_range) {
  if (is_prime(i)) {
    cat(i, " ")
  }
}
cat("\n")

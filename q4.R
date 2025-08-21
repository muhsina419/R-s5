generate_password <- function(length) {
  if (length < 4) {
    stop("Password length should be at least 4 to include all character types.")
  }
  
  # Character pools
  lowercase <- letters
  uppercase <- LETTERS
  digits <- 0:9
  specials <- strsplit("!@#$%^&*()-_=+[]{}|;:,.<>?/`~", "")[[1]]
  
  # Ensure at least one from each category
  password <- c(
    sample(lowercase, 1),
    sample(uppercase, 1),
    sample(as.character(digits), 1),
    sample(specials, 1)
  )
  
  # Remaining characters
  all_chars <- c(lowercase, uppercase, as.character(digits), specials)
  remaining <- sample(all_chars, length - 4, replace = TRUE)
  
  # Combine and shuffle
  password <- sample(c(password, remaining))
  
  # Return as a single string
  paste(password, collapse = "")
}

# Example: Ask user for desired password length
length_input <- as.integer(readline(prompt = "Enter desired password length: "))
cat("Generated password:", generate_password(length_input), "\n")


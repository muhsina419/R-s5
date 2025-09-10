# Run-Length Encoding Function
run_length_encode <- function(input_string) {
  # Split the string into individual characters
  chars <- unlist(strsplit(input_string, split = ""))
  
  # Initialize variables
  encoded <- ""
  count <- 1
  
  # Loop through the characters
  for (i in 2:(length(chars) + 1)) {
    if (i <= length(chars) && chars[i] == chars[i - 1]) {
      count <- count + 1
    } else {
      # Append the character and its count to the result
      encoded <- paste0(encoded, chars[i - 1], count)
      count <- 1
    }
  }
  
  return(encoded)
}

# Example usage
input <- readline(prompt = "Enter a string to compress: ")
compressed <- run_length_encode(input)
cat("Compressed string:", compressed, "\n")

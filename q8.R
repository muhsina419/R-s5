is_palindrome <- function(input_string) {
  # Remove spaces and punctuation, convert to lowercase
  cleaned <- tolower(gsub("[^a-z0-9]", "", input_string))
  
  # Reverse the cleaned string
  reversed <- paste(rev(strsplit(cleaned, "")[[1]]), collapse = "")
  
  return(cleaned == reversed)
}

# Get input from the user
user_input <- readline(prompt = "Enter a string to check for palindrome: ")

# Check and display result
if (is_palindrome(user_input)) {
  cat("The string is a palindrome.\n")
} else {
  cat("The string is not a palindrome.\n")
}

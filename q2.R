# Caesar cipher encryption function
caesar_encrypt <- function(text, shift) {
  encrypted_chars <- sapply(strsplit(text, NULL)[[1]], function(char) {
    # Check if char is uppercase letter
    if (grepl("[A-Z]", char)) {
      # Shift within A-Z (ASCII 65-90)
      shifted <- (utf8ToInt(char) - 65 + shift) %% 26 + 65
      intToUtf8(shifted)
    }
    # Check if char is lowercase letter
    else if (grepl("[a-z]", char)) {
      # Shift within a-z (ASCII 97-122)
      shifted <- (utf8ToInt(char) - 97 + shift) %% 26 + 97
      intToUtf8(shifted)
    }
    else {
      # Non-alphabetic characters remain unchanged
      char
    }
  })
  # Combine characters back into a single string
  paste0(encrypted_chars, collapse = "")
}

# Main program
cat("Enter a sentence to encrypt: ")
sentence <- readline()

cat("Enter shift value (integer): ")
shift_value <- as.integer(readline())

# Encrypt the sentence
encrypted_sentence <- caesar_encrypt(sentence, shift_value)

cat("Encrypted sentence:\n", encrypted_sentence, "\n")

# Sample usage (uncomment below lines to run without input prompts)
sample_text <- "Hello, World!"
sample_shift <- 3
cat("Original text: ", sample_text, "\n")
cat("Shift value: ", sample_shift, "\n")
cat("Encrypted text: ", caesar_encrypt(sample_text, sample_shift), "\n")

analyze_paragraph <- function(text, word_to_replace, replacement_word) {
  # Split paragraph into words
  words <- unlist(strsplit(text, "\\W+"))
  words <- words[words != ""]  # Remove empty strings
  
  # a. Count total number of words
  total_words <- length(words)
  
  # b. Calculate average word length
  word_lengths <- nchar(words)
  avg_word_length <- mean(word_lengths)
  
  # c. Identify longest word
  longest_word <- words[which.max(word_lengths)]
  
  # d. Replace a specific word
  replaced_text <- gsub(paste0("\\b", word_to_replace, "\\b"), replacement_word, text, ignore.case = TRUE)
  
  # Print results
  cat("Total number of words:", total_words, "\n")
  cat("Average word length:", round(avg_word_length, 2), "\n")
  cat("Longest word:", longest_word, "\n")
  cat("Text after replacement:\n", replaced_text, "\n")
}

paragraph <- "This is a sample paragraph. This paragraph is meant to test the program."
analyze_paragraph(paragraph, "paragraph", "text")


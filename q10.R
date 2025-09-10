# Recursive function to reverse a list
reverse_list <- function(lst) {
  # Base case: if the list has 0 or 1 element, return it as is
  if (length(lst) <= 1) {
    return(lst)
  } else {
    # Recursively reverse the tail and append the head at the end
    return(c(reverse_list(lst[-1]), lst[1]))
  }
}

# Example usage
original_list <- list(1, 2, 3, 4, 5)
cat("Original list:\n")
print(original_list)

reversed <- reverse_list(original_list)
cat("Reversed list:\n")
print(reversed)

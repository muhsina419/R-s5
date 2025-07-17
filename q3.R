# Validation functions
is_valid_age <- function(age) {
  !is.na(age) && age == as.integer(age) && age > 0
}

is_valid_grade <- function(grade) {
  toupper(grade) %in% c("A", "B", "C", "D", "F")
}

# Initialize empty data frame to store student info
students <- data.frame(Name=character(), Age=integer(), Grade=character(), stringsAsFactors=FALSE)

max_entries <- 100  # max number of students allowed
entry_count <- 0

cat("Enter student records. Type 'done' for the name to finish input.\n\n")

repeat {
  if (entry_count >= max_entries) {
    cat("Reached maximum number of entries. Stopping input.\n")
    break
  }
  
  cat("Enter student name (or type 'done' to finish): ")
  name <- readline()
  if (tolower(name) == "done") {
    break
  }
  
  cat("Enter age: ")
  age_input <- readline()
  age <- suppressWarnings(as.integer(age_input))
  
  cat("Enter grade (A, B, C, D, F): ")
  grade <- readline()
  grade <- toupper(grade)
  
  # Validate age and grade
  if (!is_valid_age(age)) {
    cat("Invalid age! Age must be a positive integer. Record skipped.\n\n")
    next
  }
  
  if (!is_valid_grade(grade)) {
    cat("Invalid grade! Grade must be one of A, B, C, D, F. Record skipped.\n\n")
    next
  }
  
  # Store valid record
  students <- rbind(students, data.frame(Name=name, Age=age, Grade=grade, stringsAsFactors=FALSE))
  entry_count <- entry_count + 1
  cat("Record added.\n\n")
}

# Show results
if (nrow(students) == 0) {
  cat("No valid student records entered.\n")
} else {
  cat("\nValid student records:\n")
  print(students)
  
  avg_age <- mean(students$Age)
  cat(sprintf("\nAverage age of valid students: %.2f\n", avg_age))
}

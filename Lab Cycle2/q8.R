# ============================================================
# Lab Cycle 2 - Q8 : Titanic Data Visualization & Analysis
# ============================================================

# --- 1. Setup and Read Data ---------------------------------
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Automatically detect working directory
cat("📂 Current working directory:", getwd(), "\n")

# Define path to Titanic CSV
# 👉 Make sure titanic.csv is in the same folder as q8.R
file_path <- "titanic.csv"

if (!file.exists(file_path)) {
  stop("❌ File 'titanic.csv' not found. Please place it in the same folder as q8.R or update the path.")
}

titanic <- read.csv(file_path, stringsAsFactors = TRUE)
cat("✅ Titanic dataset loaded successfully!\n\n")

# --- 2. Data Summary -----------------------------------------
str(titanic)

# Convert Parch column to numeric (if not already)
titanic$Parch <- as.numeric(as.character(titanic$Parch))

# Basic statistics
summary(titanic)

# Missing values
cat("\n🔍 Missing values per column:\n")
print(colSums(is.na(titanic)))

# --- 3. Plot 1: Histogram of Parch ----------------------------
png("hist_parch.png", width = 800, height = 600)
hist(
  titanic$Parch,
  main = "Distribution of Number of Parents/Children Aboard",
  xlab = "Number of Parents/Children (Parch)",
  ylab = "Frequency",
  col = "lightblue",
  border = "darkblue"
)
dev.off()
cat("✅ Saved: hist_parch.png\n")

# --- 4. Plot 2: Survival by Gender ----------------------------
png("bar_survival_gender.png", width = 800, height = 600)
barplot(
  table(titanic$Sex, titanic$Survived),
  beside = TRUE,
  col = c("lightcoral", "lightblue"),
  legend = c("Female", "Male"),
  main = "Survival by Gender",
  xlab = "Survival (0 = Died, 1 = Survived)",
  ylab = "Count"
)
dev.off()
cat("✅ Saved: bar_survival_gender.png\n")

# Survival rate by gender
cat("\n📊 Survival Rate by Gender:\n")
print(aggregate(Survived ~ Sex, data = titanic, mean))

# --- 5. Plot 3: Survival by Passenger Class -------------------
png("bar_survival_class.png", width = 800, height = 600)
barplot(
  table(titanic$Pclass, titanic$Survived),
  beside = TRUE,
  col = c("gold", "lightgreen", "lightpink"),
  legend = c("1st Class", "2nd Class", "3rd Class"),
  main = "Survival by Passenger Class",
  xlab = "Survival (0 = Died, 1 = Survived)",
  ylab = "Count"
)
dev.off()
cat("✅ Saved: bar_survival_class.png\n")

# Survival rate by class
cat("\n📊 Survival Rate by Class:\n")
print(aggregate(Survived ~ Pclass, data = titanic, mean))

# --- 6. Summary ----------------------------------------------
cat("\n✅ All plots generated and saved successfully!\n")
cat("🖼 Files saved:\n - hist_parch.png\n - bar_survival_gender.png\n - bar_survival_class.png\n")

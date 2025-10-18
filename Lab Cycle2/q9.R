# ============================================================
# Lab Cycle 2 - Q9 : Iris Dataset Analysis & Visualization
# ============================================================

# --- 1. Install and Load Required Packages -------------------
options(repos = c(CRAN = "https://cloud.r-project.org"))

packages <- c("ggplot2", "GGally", "dplyr")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

# --- 2. Load and Inspect Data --------------------------------
data("iris")
cat("✅ Iris dataset loaded successfully!\n\n")

str(iris)
summary(iris)

# Check for missing values
cat("\n🔍 Missing values per column:\n")
print(colSums(is.na(iris)))

# --- 3. ANOVA: Sepal.Length ~ Species -------------------------
cat("\n📊 Performing ANOVA on Sepal.Length by Species...\n")
anova_result <- aov(Sepal.Length ~ Species, data = iris)
summary_result <- summary(anova_result)
print(summary_result)

# Save ANOVA results to a text file
sink("anova_result.txt")
cat("ANOVA Results: Sepal.Length ~ Species\n")
print(summary_result)
sink()
cat("✅ Saved: anova_result.txt\n")

# --- 4. Plot 1: Pair Plot using GGally ------------------------
cat("\n🎨 Generating ggpairs plot...\n")

png("iris_pairs_plot.png", width = 900, height = 900)
ggpairs(iris, aes(color = Species, alpha = 0.7))
dev.off()
cat("✅ Saved: iris_pairs_plot.png\n")

# --- 5. Plot 2: Boxplot of Sepal Length by Species ------------
cat("\n🎨 Generating boxplot...\n")

p <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Sepal Length by Species",
    y = "Sepal Length (cm)",
    x = "Species"
  ) +
  theme_minimal()

ggsave("iris_boxplot.png", plot = p, width = 8, height = 5, dpi = 300)
cat("✅ Saved: iris_boxplot.png\n")

# --- 6. Summary ----------------------------------------------
cat("\n✅ All plots and results generated successfully!\n")
cat("🖼 Files saved:\n - iris_pairs_plot.png\n - iris_boxplot.png\n - anova_result.txt\n")

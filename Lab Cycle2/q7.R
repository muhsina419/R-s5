# ============================================================
# Lab Cycle 2 - Q7 : COVID-19 Time Series and Visualization
# ============================================================

# --- 1. Install and load necessary packages -----------------
# Set default CRAN mirror (for Rscript use)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install packages if missing
packages <- c("ggplot2", "dplyr", "lubridate", "tidyr")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

# --- 2. Read the data from GitHub ----------------------------
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid <- read.csv(url, stringsAsFactors = FALSE)

cat("✅ Data loaded successfully\n")
cat("Rows:", nrow(covid), " Columns:", ncol(covid), "\n\n")

# --- 3. Clean / transform data -------------------------------

# Convert Date column to Date type
covid$Date <- as.Date(covid$Date)

# Aggregate globally for each date
covid_global <- covid %>%
  group_by(Date) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  ) %>%
  arrange(Date)

# Filter for a specific country (India)
covid_country <- covid %>%
  filter(Country.Region == "India") %>%
  group_by(Date) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  ) %>%
  arrange(Date)

# --- 4. Plot 1: Global Confirmed Cases ------------------------

p <- ggplot(covid_global, aes(x = Date, y = Confirmed)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(color = "darkblue", size = 1.5) +
  labs(
    title = "Global COVID-19 Confirmed Cases Over Time",
    x = "Date",
    y = "Cumulative Confirmed Cases"
  ) +
  theme_minimal()

ggsave("global_confirmed_cases.png", plot = p, width = 8, height = 5, dpi = 300)
cat("✅ Saved: global_confirmed_cases.png\n")

# --- 5. Plot 2: Multiple Metrics Together ---------------------

covid_long <- covid_global %>%
  pivot_longer(cols = c("Confirmed", "Deaths", "Recovered"),
               names_to = "Metric",
               values_to = "Count")

p2 <- ggplot(covid_long, aes(x = Date, y = Count, color = Metric)) +
  geom_line(linewidth = 1) +
  labs(
    title = "COVID-19 Global Trends: Confirmed, Deaths, Recovered",
    x = "Date",
    y = "Count",
    color = "Metric"
  ) +
  theme_minimal()

ggsave("global_trends.png", plot = p2, width = 8, height = 5, dpi = 300)
cat("✅ Saved: global_trends.png\n")

# --- 6. Plot 3: India Specific --------------------------------

p_india <- ggplot(covid_country, aes(x = Date, y = Confirmed)) +
  geom_line(color = "forestgreen", linewidth = 1) +
  labs(
    title = "COVID-19 Confirmed Cases Over Time in India",
    x = "Date",
    y = "Cumulative Confirmed Cases"
  ) +
  theme_minimal()

ggsave("india_confirmed_cases.png", plot = p_india, width = 8, height = 5, dpi = 300)
cat("✅ Saved: india_confirmed_cases.png\n")

# --- End of Script --------------------------------------------
cat("\n✅ All plots generated and saved successfully!\n")

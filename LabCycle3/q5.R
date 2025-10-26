# Load required libraries
library(forecast)

# Read the dataset
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid_data <- read.csv(url)


covid_data$Date <- as.Date(covid_data$Date)


india_data <- covid_data[covid_data$Country.Region == "India" & 
                           covid_data$Date >= as.Date("2020-01-22") & 
                           covid_data$Date <= as.Date("2020-12-15"), ]


get_week_start <- function(date) {
  as.Date(cut(date, breaks = "week", start.on.monday = TRUE))
}
india_data$week <- get_week_start(india_data$Date)


week_list <- unique(india_data$week)
confirmed_weekly <- tapply(india_data$Confirmed, india_data$week, max)
deaths_weekly <- tapply(india_data$Deaths, india_data$week, max)

# Combine into a data frame
weekly_data <- data.frame(
  week = as.Date(names(confirmed_weekly)),
  Confirmed = as.numeric(confirmed_weekly),
  Deaths = as.numeric(deaths_weekly)
)


ts_cases <- ts(weekly_data$Confirmed, start = c(2020, 4), frequency = 52)


ts_multi <- ts(weekly_data[, c("Confirmed", "Deaths")], start = c(2020, 4), frequency = 52)


fit <- auto.arima(ts_cases)
forecast_cases <- forecast(fit, h = 5)


par(mfrow = c(3, 1))  # Arrange plots in 3 rows

# (1) Univariate Time Series Plot
plot(ts_cases, main = "Weekly Total Positive COVID-19 Cases in India (2020)",
     ylab = "Total Cases", xlab = "Weeks", col = "blue", lwd = 2)

# (2) Multivariate Time Series Plot
matplot(weekly_data$week, weekly_data[, c("Confirmed", "Deaths")],
        type = "l", col = c("blue", "red"), lwd = 2,
        xlab = "Week", ylab = "Count",
        main = "Total Cases vs Deaths in India (Weekly, 2020)")
legend("topleft", legend = c("Confirmed", "Deaths"), col = c("blue", "red"), lty = 1, lwd = 2)

# (3) Forecast Plot
plot(forecast_cases, main = "ARIMA Forecast: Total Positive COVID-19 Cases (Next 5 Weeks)",
     ylab = "Total Cases", xlab = "Time")

par(mfrow = c(1, 1))  # Reset layout
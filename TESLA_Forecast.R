# install.packages("quantmod")
# install.packages("tseries")
# install.packages("forecast")

# library(quantmod)
# library(tseries)
# library(forecast)

# Get Tesla stock data
# getSymbols("TSLA", src = "yahoo", from = "2020-01-01", to = Sys.Date())
# tsla <- Cl(TSLA)  # Extract the closing prices

# Perform the Augmented Dickey-Fuller Test
# adf.test(tsla)

# Differencing the series to make it stationary
# tsla_diff <- diff(tsla, differences = 1)

# Plot the differenced series
# plot(tsla_diff, main = "Differenced Tesla Stock Prices", ylab = "Differenced Price", xlab = "Date")

# Perform the Augmented Dickey-Fuller Test on the differenced series
# adf.test(na.omit(tsla_diff))

# Plot ACF and PACF
# par(mfrow = c(1, 2))
# acf(na.omit(tsla_diff), main = "ACF of Differenced Series")
# pacf(na.omit(tsla_diff), main = "PACF of Differenced Series")

# Fit the ARIMA(1, 1, 1) model
# fit <- arima(tsla, order = c(1, 1, 1))
# summary(fit)

# Forecast the next 30 days
# par(mfrow = c(1, 1))
# forecast_values <- forecast(fit, h = 30)

# Check residuals
checkresiduals(fit)
plot(forecast_values)
# library(quantmod)
# library(tseries)
# library(forecast)
# library(urca)
# library(ggplot2)

# # Get Tesla stock data
# getSymbols("TSLA", src = "yahoo", from = "2020-01-01", to = Sys.Date())
# tsla <- Cl(TSLA) # Extract the closing prices
# 
# # Handle missing data
# tsla <- na.omit(tsla)
# 
# # Plot the time series
# plot(tsla, main = "Tesla Stock Prices", ylab = "Price", xlab = "Date", col = "blue")
# grid()
# 
# # Perform the Augmented Dickey-Fuller Test
# adf_result <- adf.test(tsla)
# print(adf_result) # p-value = 0.4869669
# 
# # If the p-value > 0.05, the series is not stationary, so we difference it
# if (adf_result$p.value > 0.05) {
#   tsla_diff <- diff(tsla, differences = 1)
#   tsla_diff <- na.omit(tsla_diff) # Remove NA values after differencing
#   plot(tsla_diff, main = "Differenced Tesla Stock Prices", ylab = "Differenced Price", xlab = "Date", col = "blue")
#   grid()
# 
#   # Perform the ADF test on the differenced series
#   adf_result_diff <- adf.test(tsla_diff)
#   print(adf_result_diff$p.value)
# 
#   # Check if the differenced series is stationary
#   if (adf_result_diff$p.value > 0.05) {
#     print("The differenced series is still not stationary. Consider further transformations or differencing.")
#   } else {
#     print("The differenced series is now stationary.")
#   }
# } else {
#   tsla_diff <- tsla
#   print("The original series is already stationary.")
# }
# 
# adf_result_diff <- adf.test(tsla_diff)
# print(adf_result_diff$p.value)
# 
# # Plot ACF and PACF
# par(mfrow = c(1, 2))
# acf(tsla_diff, main = "ACF of Differenced Series")
# pacf(tsla_diff, main = "PACF of Differenced Series")
# grid()
# 
# # Fit the ARIMA model
# fit <- auto.arima(tsla)
# summary(fit)
# 
# # Forecast the next 30 days
# term <- 30
# forecast_values <- forecast(fit, h = term)
# 
# # Ensure dates are correctly aligned in the forecast plot
# autoplot(forecast_values) + ggtitle("1 month Forecast for Tesla Stock Prices") + xlab("Date") + ylab("Price") + theme_minimal()
# 
# # Check residuals
# checkresiduals(fit)
# print(forecast_values)
# 
# # Ensure the forecast dates are correctly set

# last_observation <- as.numeric(tsla[length(tsla)])
# forecast_original <- last_observation + cumsum(forecast_values$mean)

# forecast_df <- data.frame(Date = forecast_dates, Forecast = forecast_original)

ggplot(forecast_df, aes(x = Date, y = Forecast)) +
  geom_line(color = "blue") +
  ggtitle("1 month Forecast for Tesla Stock Prices") +
  xlab("Date") +
  ylab("Price") +
  theme_minimal()

# 
# # Convert forecast values back to original scale if differencing was done
# forecast_original <- tsla[length(tsla)] + cumsum(forecast_values$mean)

# # Plot the forecast with correct dates
# forecast_df <- data.frame(Date = forecast_dates, Forecast = as.numeric(forecast_original))
# ggplot(forecast_df, aes(x = Date, y = Forecast)) +
#   geom_line(color = "blue") +
#   ggtitle("1 month Forecast for Tesla Stock Prices") +
#   xlab("Date") +
#   ylab("Price") +
#   theme_minimal()
# 
# # Print forecast values
# print(forecast_df)

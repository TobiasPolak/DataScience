# Basic Time Series Analysis
A <- read.csv("/Users/tobiaspolak/Downloads/tijdreeks.csv") * 1000

require(tseries); library(tseries)

# Estimate an ARMA(p,q) (auto-regressive moving average) timeseries model.
# Selection of (p,q) is done automatically by R based on AIC (I believe)

x <- A[,2]
a <- arma(x)

# Inspect the outcomes
summary(a)

# Make the plot
plot.ts(a$fitted.values, col = 'darkblue', ylab = "Visitors", xlab = "Time (weeks)")
par(new = TRUE)
plot.ts(x, col = 'darkred', xlab = "''", ylab = "", axes = F)

# Evaluate by RMSPE
RMSPE <- sqrt(mean(a$residuals[complete.cases(a$residuals)]^2))

# This is a way-to-basic model, ofcourse. Ideally, we would add marketing explanatory variables


rm(list=ls(all=TRUE))
cat("\014")

library(tidyverse)
library(here)

CovidData <- read_csv("US.Covid.Data.csv")
MarketData <- read_csv("SPY-3.csv")

view(CovidData)
view(MarketData)

CovidData$pctPositiveIncrease <- 0
view(CovidData)
n <- length(CovidData$date)
for (i in 2:n) {
  CovidData$pctPositiveIncrease[i] <- (CovidData$positiveIncrease[i] - CovidData$positiveIncrease[i+1])/CovidData$positiveIncrease[i+1]
}
view(CovidData)

MarketData$pctChange <- 0
view(MarketData)
n <- length(MarketData$Date)
for (i in 2:n) {
  MarketData$pctChange[i] <- (MarketData$Close[i] - MarketData$Close[i-1])/MarketData$Close[i-1]
}

view(MarketData)



library(here)
library(tidyverse)
library(readr)
library(ggplot2)
Combo  <- read_csv("Condensed Spy and Covid Data.csv")
Combo$Date <- as.Date(Combo$Date)
#Combo$Covid_Change <- as.vector(Combo$Covid_Change)
#Combo$SPY_Change <- as.vector(Combo$SPY_Change)
View(Combo)
p <- ggplot(data = Combo)

p + geom_line(mapping=aes(group=1, color="Covid", x=Date,y=Covid_Change)) +
  geom_line(mapping=aes(group=1, color="SPY", x= Date, y=SPY_Change)) +
  geom_point((mapping=aes(x= Date, y=SPY_Change))) +
  geom_point((mapping=aes(x= Date, y=Covid_Change))) +
  labs(title = "Monthly S&P 500 Returns vs Covid Case Increases (May 2020-March 2021)", y="Percent Change") 


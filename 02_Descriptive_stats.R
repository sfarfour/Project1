
### Project 1: House Prices
### Description: Predict sales prices based on house characteristics
### By: Samer Farfour

options(scipen=999)

library("tidyverse")
library("readr")
library("ggplot2")
library("plotly")
library("dplyr")


train_data <- read_csv("C:/Users/samer/OneDrive/Desktop/R/Project1_house_prices/train.csv")
class(train_data)

head(train_data)
summary(train_data)
glimpse(train_data)

# Variable of interest
summary(train_data$SalePrice)
boxplot(train_data$SalePrice)
ggplot(train_data) + aes(x=SalePrice) + geom_histogram()
# Variable distribution is skewed to the right















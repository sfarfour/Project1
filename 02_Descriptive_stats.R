
### Project 1: House Prices
### Description: Predict sales prices based on house characteristics
### Code: 02_Descriptive_stats
### By: Samer Farfour


#options(tibble.width = 10)
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

### Variable of interest
summary(train_data$SalePrice)
boxplot(train_data$SalePrice)
ggplot(train_data) + aes(x=SalePrice) + geom_histogram()
# Variable distribution is skewed to the right



### Pre-processing

## Calculate total count of missing values per variable
total <- colSums(is.na(train_data))
total <- total[order(-total)]
missing_values_count <- data.frame(total)

# To simplify this problem, we will remove all the variables with at least 2 missing values
# For the variable "Electrical", which only has 1 missing value, we will impute with the mean
variables_to_remove <- rownames(missing_values_count)[missing_values_count$total > 1]
print(variables_to_remove) # 18 variables to remove

train_data2 <- train_data[,-which(names(train_data) %in% variables_to_remove)]

ncol(train_data2) # should be (81-18) = 63

## Impute missing value for variable "Electrical"
ggplot(train_data) + aes(Electrical) + geom_bar()
train_data2 <- data.frame(train_data2)
# Most used value is "SBrkr", so we will use that to impute the missing value
find_mode <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[which.max(tab)]
}

find_mode(train_data2$Electrical)

train_data2[is.na(train_data2$Electrical),"Electrical"] = find_mode(train_data2$Electrical)
train_data2[1380,]


## Check for aberrant values





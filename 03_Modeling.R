
### Project 1: House Prices
### Description: Predict sales prices based on house characteristics
### Code: 03_Modeling
### By: Samer Farfour

## FIRST MODEL :
# Basic models (linear reg, forward linear reg, backward linear reg)
intercept_only <- lm(SalePrice ~ 1, data=train_data2)
all <- lm(SalePrice ~ ., data=train_data2)

forward <- step(intercept_only, direction="forward", scope=formula(all), trace=F)
backward <- step(all, direction="backward", trace=F)

AIC(all)
AIC(forward)
AIC(backward)


## SECOND MODEL :
# More complex methodology ;
# 1. Test the dependence of each remaining variable with the variable of interest
# 2. Keep the variables that have statistically significant dependence
#   a) For continuous variables : use Pearson's correlation coefficient
#   b) For discrete variables : use ANOVA (or t-test)
# 3. Do the linear reg with these variables

discrete_variables <- c()
continuous_variables <- c()

for(i in colnames(train_data2)){
  if (class(train_data2[,i]) == "character") {
    discrete_variables <- c(discrete_variables, i)
  }
  else {
    continuous_variables <- c(continuous_variables, i)
  }
}











## THIRD MODEL :
# GLM ?








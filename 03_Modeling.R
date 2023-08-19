
### Project 1: House Prices
### Description: Predict sales prices based on house characteristics
### Code: 03_Modeling
### By: Samer Farfour

options(scipen=0, digits=6)

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

discrete_variables
continuous_variables


# Discrete variables

n <- 1
cor_pearson <- data.frame(continuous_variables)

# Continuous variables
for (i in continuous_variables){
  cor_pearson[n,"pearson"] <- cor.test(train_data2[,i], train_data2[,"SalePrice"], method="pearson")$estimate
  cor_pearson[n,"statistic"] <- cor.test(train_data2[,i], train_data2[,"SalePrice"], method="pearson")$statistic
  cor_pearson[n,"p-value"] <- cor.test(train_data2[,i], train_data2[,"SalePrice"], method="pearson")$p.value
  n <- n+1
}

n <- 1

# Criteria of decision for Pearson coeff ?
for (i in continuous_variables){
  if (cor_pearson[n,"p-value"] <= 0.05){
    cor_pearson[n,"keep"] = 1
  }
  else {
    cor_pearson[n,"keep"] = 0
  }
  n <- n+1
}








## THIRD MODEL :
# GLM ?








boston.df <- read.csv('C:\\Users\\Mohit\\Desktop\\R4DS\\BostonHousing.csv', header = TRUE)
dim(boston.df)
set.seed(1)
train.rows <- sample(rownames(boston.df), dim(boston.df)[1] * 0.6)
train.rows
train.data <- boston.df[ train.rows, ]
train.data

valid.rows <- setdiff(rownames(boston.df), train.rows)
valid.rows
valid.data <- boston.df[ valid.rows, ]
valid.data

reg <- lm(MEDV ~ CRIM, data = boston.df, subset = train.rows)   ## lm - Linear Model(i.e., linear Regression)
reg
reg $ coefficients

tr.res <- data.frame( train.data $ MEDV, reg $ fitted.values, reg $ residuals )
head( tr.res )

pred <- predict( reg, newdata = valid.data)
vl.res <- data.frame( valid.data $ MEDV, pred, residuals = valid.data $ MEDV - pred )
pred
head(vl.res)

reg2 <- lm(MEDV ~ CRIM + AGE, data = boston.df, subset = train.rows)
reg2


reg3 <- lm(MEDV ~ . - CAT.MEDV, data = boston.df, subset = train.rows)
reg3

args(lm)      ## it returns args or parameters
example(lm)   ## It return the result of olved problem
?lm           ## It gives the description of 'lm'

install.packages('forecast')
install.packages('uroot')
library(forecast)

accuracy(reg$fitted.values,train.data$MEDV) #computed accuracy on training set
accuracy(pred,valid.data$MEDV)

##Heading: DATA PRE-PROCESSING
#Q: Try installing a package psych
install.packages('psych')
library(psych)  #loading a package;analogous to import in JAVA
describe(boston.df)
#Q:Difference between summary and describe
summary(boston.df)
#Ans: describe gives more information of a field compare to summary.

#We need to normalize to bring data in same range for better comparison
# Z=(X-Nu[Mean])/Sigma[SD]
#Other technique for Normalization:  X-min/(max-min)[Range]
#Range will be in 0-1 for all
# Golden Rule: Always NORMALIZE your data
mean(boston.df$CRIM)
sd(boston.df$CRIM)
min(boston.df$CRIM)
max(boston.df$CRIM)
median(boston.df$CRIM)
is.na(boston.df$CRIM)  #To find missing values in CRIM
sum(is.na(boston.df$CRIM)) #To count the missing value
sapply(boston.df,mean) #Mean of all rows

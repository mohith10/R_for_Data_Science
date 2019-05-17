input.df <- read.csv("train.csv", header = TRUE) # our dataset has header in its first row.
output.df <- read.csv("test.csv", header = TRUE) # our dataset has header in its first row.



input.df[10][is.na(input.df[10])] <- 20
input.df[11][is.na(input.df[11])] <- 20
  

output.df[10][is.na(output.df[10])] <- 20
output.df[11][is.na(output.df[11])] <- 20

sum(is.na(input.df$Product_Category_3))

X= input.df[3:11]  
Y= input.df[12]

X_new= output.df[3:11]  


library(data.table)
library(mltools)
X <- one_hot(as.data.table(X))
X_new <- one_hot(as.data.table(X_new))

X$Product_Category_1 = scale(X$Product_Category_1)
X$Product_Category_2 = scale(X$Product_Category_2)
X$Product_Category_3 = scale(X$Product_Category_3)
X_new$Product_Category_1 = scale(X_new$Product_Category_1)
X_new$Product_Category_2 = scale(X_new$Product_Category_2)
X_new$Product_Category_3 = scale(X_new$Product_Category_3)
X$Purchases<- Y

reg2<- lm(Purchases~.,data=X)


pred<-predict(reg2,newdata=X_new)
df <- data.frame(User_ID = output.df$User_ID, Product_ID = output.df$Product_ID,Purchase = pred)
write.csv(df,"result.csv",row.names = FALSE)

library(rpart)
regressor =rpart(Purchases~.,data = X)
# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, X_new)
df <- data.frame(User_ID = output.df$User_ID, Product_ID = output.df$Product_ID,Purchase = y_pred)
write.csv(df,"result1.csv",row.names = FALSE)


library(e1071)
regressor = svm( Purchases~.,data = X, type = 'eps-regression',kernel = 'radial')

# Predicting a new result
y_pred = predict(regressor, X_new)
df <- data.frame(User_ID = output.df$User_ID, Product_ID = output.df$Product_ID,Purchase = y_pred)
write.csv(df,"result2.csv",row.names = FALSE)

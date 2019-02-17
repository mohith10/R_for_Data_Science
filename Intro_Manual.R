#Fetching the Boston Housing Data in dataframe, stringAsFactor
# is set to False inorder to restrict the converstion of string 
#type fields to numerical

dataframe.df <- read.csv('D:\\Mohit\\R\\BostonHousing.csv',header = TRUE, stringsAsFactors=FALSE)
#To remove a datafram simply use, rm(datagrame name)
# example: Here it will be 
rm(dataframe.df)

# Easy Data Analysis Ahead

#head: to exhibit headers of dataframe (6, by deafault)
head(dataframe.df)
# Give n value 
head(dataframe.df, n=10)

#To see the strucutre of dataframe
str(dataframe.df)

# If you wish to see only row/collumn names
rownames(dataframe.df)
colnames(dataframe.df)

# To get an overall picture of each collumn
summary(dataframe.df)

# To get even better picture of your data 
install.packages('psych')
library('psych')
describe(dataframe.df)

#To find mode
install.packages('modeest')
library('modeest')
example('mfv')
mfv(dataframe.df)

#Finding the correlation
cor(dataframe.df)
# Mean return NA even after a single value has NA
#So to avoid this put na.rm=TRUE
mean(dataframe.df$CRIM,na.rm=TRUE)

#Selecting particular amount of data
choose(15,4)

#Just to see the names
names(dataframe.df)
house.names<-names(dataframe.df)
house.names
rm(house.names)

#To acces the data of a particular collumn in dataset
dataframe.df$CRIM
#For multiple collumns
dataframe.df$CRIM

#Slicing the data
datasliced.df<-dataframe.df[1:2,1:4]
datasliced.df

#Selceting non-contigous collumns
datasliced.df<-dataframe.df[1:2,c(1,3,5)]
datasliced.df
#note-R indexes from 1 NOT 0 and R is case Sensitive
#Negative indexing means to exculde that indexed collumn
rm(datasliced.df)
#Conditional Choosing
dataframe.df$CRIM>20
#Value conversion
datasliced.df<-dataframe.df[dataframe.df$CRIM>20,1:2]
datasliced.df

#Exhibitng it in TABLE format
table(datasliced.df)


#----------DATA VISUALIZATION--------------------#

plot(dataframe.df$CRIM,dataframe.df$AGE)
#Naming axes and Plot

plot(dataframe.df$CRIM,dataframe.df$AGE,xlab = 'CRIME RATE', ylab = 'AGE',main='My Plot')

#Using GGPLOT
install.packages('ggplot2')
library('ggplot2')

qplot(CRIM,DIS,data=dataframe.df,geom="jitter")
colnames(dataframe.df)

#The point may represent more than one entry
#To obtain LINE graph
ggplot(dataframe.df,aes(x=CRIM,y=DIS),ylim=0) + geom_line() +geom_point()

#Dealing with bar graphs
newdata.df<- dataframe.df[dataframe.df$CRIM<10,1:3]
newdata.df
barplot(newdata.df$INDUS, main="Bar Graph", names.arg = 'INDUS')
#Histogram

?hist

hist(newdata.df$CRIM,breaks=5)
#Coloring the Graph
colors<- rainbow(6)
newdata.df
barplot(newdata.df$CRIM,col='royalblue3')

#Syntax QUIRCKS------------------------------

#Combine

combined.df<- c(dataframe.df[1:5,-1])
combined.df
# To find the dimension

dim(dataframe.df)






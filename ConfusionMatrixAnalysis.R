#----------------
# Cost of misclassification can be higher for one than the other(s).

#Predict class- ROW and Actual class- COLUMN
#If 2 classes C0 AND C1; C1 is important class.
#Sensitivity(aka RECALL)-% of C1 class correctly measured.
#Specificity-%of C0 class correctly measured.
#Precision-% of C1 that are actually c1

#                     Actual
 #               |  C1   |     C2
#           ---------------------
#   predicted C1 | N11   |    n21
 #               
#             C2 | n12   |    n22

#   Senstivity(aka RECALL)- n11/(n11+n12)
#   Specificity- n22/(n21+n22)
#   FDR(False discovery Rate)- C1 predictions classififed wrong. i.e N21/(n11+n12)
#   Flase Omission Rate(FOR)- C2 preidiction went wrong. i.e n12/(n11+n12)
#   Precision- n11/(n11+n12)-----FDR is complement of this.
# Application-Performance of SEARCH ENGINE is based on these factors.


#------------------------------------------------------------------------
#Lift CHART- using Gains package
# Steps
#1. Sort all in decreasing order.
#2. 

#-------------------------------------------------------------------------
#DECILE CHART (Same as Lift Chart)
#---------------------------------------------------------------------------
install.packages('caret')
library(caret)
install.packages('e1071')
library(e1071)
owner.df <- read.csv('D:\\Mohit\\R\\ownerExample.csv', header = TRUE)
str(boston.df)
confusionMatrix(ifelse(owner.df$Probability>0.5, 'owner', 'nonowner'),owner.df$Class)

confusionMatrix(ifelse(owner.df$Probability>0.25,'owner','nonowner'),owner.df$Class)

confusionMatrix(ifelse(owner.df$Probability>0.75,'owner','nonowner'),owner.df$Class)





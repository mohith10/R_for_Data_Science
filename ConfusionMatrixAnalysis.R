#----------------
# Cost of misclassification can be higher for one than the other(s).

#Predict class- ROW and Actual class- COLUMN
#If 2 classes C0 AND C1; C1 is important class.
#Sensitivity-% of C1 class correctly measured.
#Specificity-%of C0 class correctly measured.
#Precision-% of C1 that are actually c1

#                     Actual
 #               |  C1   |     C2
#           ---------------------
#   predicted C1 | N11   |    n21
 #               
#             C2 | n12   |    n22

#   Senstiivity- n11/(n11+n12)
#   Specificity- n22/(n21+n22)
#   FDR(False discovery Rate)- C1 predictions classififed wrong. i.e N21/(n11+n12)
#   Flase Omission Rate(FOR)- C2 preidiction went wrong. i.e n12/(n11+n12)
#   Precision- n11/(n11+n12)-----FDR is complement of this.
#




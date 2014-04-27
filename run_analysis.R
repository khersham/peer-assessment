#Set your own directory with the data

setwd("C:/Users/khersham/Downloads/UCI HAR Dataset/")
library(reshape2)

#Load all the relevant data to 4 sets (xTrain, xTest, yTrain, yTest), feature label (flabel) and activity label (actlabel)

flabel <- read.table("features.txt")
actlabel <- read.table("activity_labels.txt")

xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt",col.names = "Activity")
subTrain <- read.table("./train/subject_train.txt",col.names = "Subject")

xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt",col.names = "Activity")
subTest <- read.table("./test/subject_test.txt",col.names = "Subject")

#Naming the columns for x data set

names(xTrain) <- as.character(flabel$V2)
names(xTest) <- as.character(flabel$V2)

#Combine x and y individually for the training and test set

xyTrain <- cbind(xTrain,yTrain,subTrain)
xyTest <- cbind(xTest,yTest,subTest)

#Combine all the data set into a big list

xyCombine <- rbind(xyTrain, xyTest)

#Define a function to search for label containing "mean" and "std"

strReverse <- function(x, n, m){
  substr(x, nchar(x)-n+1, nchar(x)-m)
}

#For instance strReverse(flabel$V2,8,4) will yield the string "mean", this is useful as all the label's ending
#are given in the "...mean()-X" format.

MeanStr1 <- strReverse(names(xTrain),8,4)=="mean"
StdStr1 <- strReverse(names(xTrain),7,4)=="std"
MeanStr2 <- strReverse(names(xTrain),6,2)=="mean"
StdStr2 <- strReverse(names(xTrain),5,2)=="std"

#Filtering the required labels in the task

MeanLabel <- c(as.character(flabel[MeanStr1,]$V2),as.character(flabel[MeanStr2,]$V2))
StdLabel <- c(as.character(flabel[StdStr1,]$V2),as.character(flabel[StdStr2,]$V2))

reqLabel <- c(MeanLabel,StdLabel,c("Activity","Subject"))

#The complete data set with mean and std extracted

xyRequired <- xyCombine[,reqLabel]

#Replacing the activity label with name

for (i in 1:6) {
  xyRequired$Activity[xyRequired$Activity== i] <- as.character(actlabel[i,2])
}

#For step 5, we split the data into all the means and stds while grouping the activity and subject,
#the mean is then calculated for subject x activity class

spdata <- split(xyRequired[,1:66],list(xyRequired$Activity,xyRequired$Subject))
spdatamean <- sapply(spdata, colMeans)

write.table(spdatamean,file="tidy_data.txt")
Code book for explaining the variables in script

xTrain -> Training set
xTest -> Test set
yTrain -> Training labels
yTest -> Test labels
subTrain -> Subject who undergoes training
subTest -> Subject who undergoes testing

flabel -> Labels for the training/test set data
actlabel -> Activity label, consisitng of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) represented by ascending number

xyTrain -> All the training sets are column-binded together
xyTest -> All the test sets are column-binded

strReverse -> A function to search for the position of the string character with reverse order. This is useful for locating the training labels consisting of "mean" and "std". The required string locator are given in MeanStr1, MeanStr2, StdStr1, StdStr2.

xyRequired -> BY combining all the required labels (MeanLabel, StdLabel) to reqLabel, we filter out the mean and std of 

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

totaling up to 66 relevant data set. Additionally we include the "Activity" label for y-data set and "Subject" for the subject data set.

spdata -> we split the data into sets which average will be taken, for each activity carried out by individual subject (30 x 6 =180 columns in this case).
spdatamean -> The average is taken for each activity carried out by individual subject.



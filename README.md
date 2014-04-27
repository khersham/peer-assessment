The script run_analysis.R alone serves as an automated script to 

1) merge the required training data (X_train.txt, y_train.txt, subject_train.txt) and test set (X_test.txt, y_test.txt, subject_test.txt)

2) label the appropriate columns for the data, i.e. the required labels for X-data sets are called from features.txt while the activity labels for the y-data set is retrieved from activity_labels.txt.

3) serve as automated filter to select out the mean and standard deviation (std) from the training data sets. This is carried out by the string selection of the strReverse function.

4) obtain the required combined data set with mean and std filtered out -> xyRequired

5) obtain the tidied data set with the average for all the means and stds for each activity carried out by each subject.

Please refer to the comments in the script for further step by step explanation. 
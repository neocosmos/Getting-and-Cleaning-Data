---
title: "Get and Clean Data Project"
output: html_document
---

##Data source 
The raw data set for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
And the full description is available at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Variables in the data

###subject: 

Its range is from 1 to 30, represents the subject who performed the activity.

###activity:

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###Features:

 -The features selected come from the accelerometer(Acc) and gyroscope(Gyro) 3-axial raw signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

 -The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time-BodyAccJerk-XYZ and Time-BodyGyroJerk-XYZ). 

 -Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 -Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

-The set of variables that were estimated from these signals(used in this work): 

mean(): Mean value

std(): Standard deviation



##Steps taken to clean the data
###1.Merges the training and the test sets to create one data set.

The following sets are merged into one data set.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 

###2.Extracts only the measurements on the mean and standard deviation for each measurement. 

'features.txt' is a list of all features, corresponding to rows of traing/test set(X). Use "grepl" to selecte the feature with "mean" and "standard deviation" and subset the data.

###3.Uses descriptive activity names to name the activities in the data set

'activity_labels.txt' links the class labels with the activity names.
The labels are replaced in subset data with the activity names.


###4.Appropriately labels the data set with descriptive variable names. 

The names of the features are assigned to the row names of the subset data. In the features, name "^t" is replaced by "Time-", name "^f" is replace by "Freq-", "-std" is replace by "Std", "-mean" is replaced by "Mean" to make it clearer for reading.  

###5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The subset data is aggregated by the activity and subject to calculate the mean of each variable. The tidy data is writen into "tidy-dataset.txt"



##Other infomartion
Features are normalized and bounded within [-1,1].

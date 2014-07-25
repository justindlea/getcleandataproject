# Tidy Data CodeBook

## Data Source

This dataset was derived by transforming the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Features

From: features_info.txt (included in original data source)

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The following represent the features found in tidydata.txt:<br/>

* Subject
     + ID of volunteer who performed the activity
* Activity
     + Descriptive name of activity performed
* tBodyAccel-XYZ
* tGravityAccel-XYZ
* tBodyAccelJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccelMag
* tGravityAccelMag
* tBodyAccelJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccel-XYZ
* fBodyAccelJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccelMag
* fBodyAccelJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: <br/>
Mean: Mean value<br/>
Std: Standard deviation

## Transformations performed on the original data set
The orignal data set contains over 500 features and over 1000 raw observations. 
The tidy data set only retained features which included mean or standard deviation.
After removing those features, means were taken for all remaining features based on
every possible combination of Subject and Activity; producing a data set of 180 
obsverations of 68 features.


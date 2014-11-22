Contents in this file
=====================
From this discussion: https://class.coursera.org/getdata-009/forum/thread?thread_id=89, it is clear that the minimum for a codebook for this project is to: 
1. copy over the feature_info.txt, 
2. remove all columns that have been removed, 
3. rename the columns that have been renamed, and 
4. state the transformation. 

So the contents of this file contain necessary info related to the 4 steps above.

Feature Selection 
=================

Feature descriptions from the raw data (copy of features_info.txt)
------------------------------------------------------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' (561 variables in total)

Data tranformation done by run_analysis.R script
------------------------------------------------
The following steps have been take to transform the raw data into the tidy data set "tidydata.txt":
1. The train data set and test data set are merged together.
2. The column names of the merge data set are updated to contain "Subject", "Activity", and the 561 feature names in the raw data. The feature names are processed with make.names(NAMES,unique=T) function to make sure they are unique.
3. The values of the Activity column are replaced from the number indicating the Activity type to the name of the Activity type.
4. The columns whose names match "mean" or "std" but do not match "meanFreq" or "skewness" or "kurtosis" or "bandsEnergy" or "angle" are extracted.
5. The extracted columns are summarized with the average of each variable for each activity and each subject.
6. The summarized data are written to tidydata.txt file.

Features in the tidy data set "tidydata.txt"
--------------------------------------------
There are 68 variables in the tidydata.txt, including 1 Subject variable, 1 Activity variable, 33 mean related feature variables, and 33 standard deviation related variables.
* Subject variable contains the number of the person attending the experiment and generating the data
* Activity variable contains the activity name, whose value can be one of the following:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
* mean and standard deviation related variables have their names changed slightly from the raw data by make.names(NAMES,unique=T) function to guarantee the name uniqueness. 
** For example, **tBodyAcc-mean()-X** name in the raw data is changed to **tBodyAcc.mean...X**, by replacing **-**,**(**, and **)** with **.**
** The values of these variables are not changed at all, and their meanings are exactly the same as in the raw data. See the **Feature descriptions from the raw data (copy of features_info.txt)** section in the beginning of this file for their meanings.

**Here is the full list:**
Subject  
Activity  
tBodyAcc.mean...X  
tBodyAcc.mean...Y  
tBodyAcc.mean...Z  
tBodyAcc.std...X  
tBodyAcc.std...Y  
tBodyAcc.std...Z  
tGravityAcc.mean...X  
tGravityAcc.mean...Y  
tGravityAcc.mean...Z  
tGravityAcc.std...X  
tGravityAcc.std...Y  
tGravityAcc.std...Z  
tBodyAccJerk.mean...X  
tBodyAccJerk.mean...Y  
tBodyAccJerk.mean...Z  
tBodyAccJerk.std...X  
tBodyAccJerk.std...Y  
tBodyAccJerk.std...Z  
tBodyGyro.mean...X  
tBodyGyro.mean...Y  
tBodyGyro.mean...Z  
tBodyGyro.std...X  
tBodyGyro.std...Y  
tBodyGyro.std...Z  
tBodyGyroJerk.mean...X  
tBodyGyroJerk.mean...Y  
tBodyGyroJerk.mean...Z  
tBodyGyroJerk.std...X  
tBodyGyroJerk.std...Y  
tBodyGyroJerk.std...Z  
tBodyAccMag.mean..  
tBodyAccMag.std..  
tGravityAccMag.mean..  
tGravityAccMag.std..  
tBodyAccJerkMag.mean..  
tBodyAccJerkMag.std..  
tBodyGyroMag.mean..  
tBodyGyroMag.std..  
tBodyGyroJerkMag.mean..  
tBodyGyroJerkMag.std..  
fBodyAcc.mean...X  
fBodyAcc.mean...Y  
fBodyAcc.mean...Z  
fBodyAcc.std...X  
fBodyAcc.std...Y  
fBodyAcc.std...Z  
fBodyAccJerk.mean...X  
fBodyAccJerk.mean...Y  
fBodyAccJerk.mean...Z  
fBodyAccJerk.std...X  
fBodyAccJerk.std...Y  
fBodyAccJerk.std...Z  
fBodyGyro.mean...X  
fBodyGyro.mean...Y  
fBodyGyro.mean...Z  
fBodyGyro.std...X  
fBodyGyro.std...Y  
fBodyGyro.std...Z  
fBodyAccMag.mean..  
fBodyAccMag.std..  
fBodyBodyAccJerkMag.mean..  
fBodyBodyAccJerkMag.std..  
fBodyBodyGyroMag.mean..  
fBodyBodyGyroMag.std..  
fBodyBodyGyroJerkMag.mean..  
fBodyBodyGyroJerkMag.std..  
# Requirement 1 - Merges the training and the test sets to create one data set.

# Read subject data - train set
subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Read activity data - train set
activityTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
# Read feature data - train set
featureTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
# Merge subject data and activity data - train set
saTrainData <- cbind(subjectTrainData, activityTrainData)
# Merge saTrainData and feature data - train set
safTrainData <- cbind(saTrainData, featureTrainData)

# Read subject data - test set
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Read activity data - test set
activityTestData <- read.table("./UCI HAR Dataset/test/y_test.txt")
# Read feature data - test set
featureTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
# Merge subject data and activity data - test set
saTestData <- cbind(subjectTestData, activityTestData)
# Merge saTestData and feature data - test set
safTestData <- cbind(saTestData, featureTestData)

# Merge train and test set to form the full data set
fullData <- rbind(safTrainData, safTestData)
str(fullData)
colnames(fullData)



# Read feature and activity files
featureNamesInput <- read.table("./UCI HAR Dataset/features.txt")
activityLabelsInput <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Requirement 4 - Appropriately labels the data set with descriptive variable names. 
uniqueFeatureNames <- make.names(featureNamesInput$V2,unique = T)
colnames(fullData) <- c("Subject", "Activity", uniqueFeatureNames)
colnames(fullData)

# Requirement 3 - Uses descriptive activity names to name the activities in the data set
fullData$Activity <- factor(fullData$Activity, labels = activityLabelsInput$V2)
str(fullData)



# Requirement 2: Extracts only the measurements on the mean and standard 
# deviation for each measurement. 

# Only choose the measurement that has both mean and std variable available, 
# basically 33 variables for mean and 33 variables for std.
meanColumnPositions <- intersect(
    grep("mean",colnames(fullData)),
    grep("meanFreq|skewness|kurtosis|bandsEnergy|angle", colnames(fullData),invert=TRUE))
length(meanColumnPositions)
stdColumnPositions <- intersect(
    grep("std",colnames(fullData)),
    grep("meanFreq|skewness|kurtosis|bandsEnergy|angle",colnames(fullData),invert=TRUE))
length(stdColumnPositions)
meanAndStdColumnPositions <- intersect(
    grep("Subject|Activity|mean|std",colnames(fullData)),
    grep("meanFreq|skewness|kurtosis|bandsEnergy|angle",colnames(fullData),invert=TRUE))
length(meanAndStdColumnPositions)
filteredData <- fullData[meanAndStdColumnPositions]
str(filteredData)



# Requirement 5: Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
library(dplyr)
groupedData <- group_by(filteredData, Subject, Activity)
tidyData <- summarise_each(groupedData, funs(mean))

# Save the tidy data to a file
write.table(tidyData, file = "tidydata.txt", row.names = FALSE) 

# Verify the data is readable into R
tidyDataReadFromTheSavedFile <- read.table("tidydata.txt", header = TRUE) 
str(tidyDataReadFromTheSavedFile)
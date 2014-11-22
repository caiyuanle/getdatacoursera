What does run_analysis.R script do
==================================
The run_analysis.R script performs the following actions:  
1. Read subject, activity, and feature data from both train set and test set, and merge them together  
2. Read feature name and activity label files, and use those info to update the column names in the merged data set as well as to replace the activity numbers with activity names in the merged data set  
3. Extract columns whose names match "mean" or "std" but do not match "meanFreq" or "skewness" or "kurtosis" or "bandsEnergy" or "angle", and then summarize them with the average of each variable for each activity and each subject  
4. Write the summarized data to tidydata.txt file (also read it in as the last step to make sure the written data are valid)  

How to run run_analysis.R script with the raw data to generate the tidydata.txt
===============================================================================
Prerequisite
------------
The run_analysis.R needs **dplyr** library to perform the summarization of data. Makes sure to install dplyr package in R first before running the script.  

Steps
-----
1. Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzip it, and copy the **UCI HAR Dataset** folder inside the unzipped folder to the working directory of R
2. Copy run_analysis.R script to the working directory of R
3. In R, run **source("run_analysis.R")**
4. Wait around 30 secs to 1 min
5. Once the execution is done, find the **tidydata.txt** in the working directory of R.

Where is the code book for tidydata.txt
=======================================
The code book for tidydata.txt is the **CodeBook.md** file next to this README.md file. 
  * Please check that file for details of the variables inside the tidydata.txt.
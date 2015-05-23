# CodeBook

This code book describes the originl data source and variables in the final file

## The original data source

* Downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The data cleaning process

Following steps are implemented in the script to process the raw data and created a final tidy data set:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy data set (180 rows, 68 columns)
* First column is the subject number (30 subjects are assigned number 1 - 30)
* Second column is the activity the subject performs
* Rest of the columns display the average of the mean and standard deviation for the measurement of each subject (column 1) when performing an activity (column 2)

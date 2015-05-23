# Getting and Cleaning Data

## Course Project Requirements:

You should create one R script called run_analysis.R that does the following: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step by step guide to run the run_analysis.R script:

* Download the zip file from below link and unzip to the R working directory, the result is a folder named ```UCI HAR Dataset```:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Save the run_analysis.R script in the R working directory (same directory as the ```UCI HAR Dataset``` folder
* In R command, run ```source("run_analysis.R")```, a new file ```tidy_data.txt``` will be created in your working directory.
* A sample ```tidy_data.txt``` can be found in the repository for comparison.

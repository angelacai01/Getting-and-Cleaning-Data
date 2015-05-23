# Create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# #1. Merges the training and the test sets to create one data set.
# 1-1 read training and test data into the table
trainXData <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
testXData <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

trainYData <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
testYData <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# 1-2 merge training and test data
allXData <- rbind(trainXData, testXData)
allYData <- rbind(trainYData, testYData)
allSubjectData <- rbind(subjectTrainData, subjectTestData)

#head(allXData)
#head(allYData)
#head(allSubjectData)
#dim(trainXData)
#dim(testXData)
#dim(allXData)

# #2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 2-1 read features data into the table
featuresData <- read.table("./UCI HAR Dataset/features.txt")

# 2-2 find feature name that matches mean or standard deviation 
# and store the indices of the element in a vector
featureIndexData <- grep("-mean\\(\\)|-std\\(\\)", featuresData[,2]) 
#featureIndexData

# 2-3 extract the X data only for those coloumns exists in the featureIndex
allXData <- allXData[, featureIndexData] 
# 2-4 replace the extracted merge X data column name with feature name from the features data 

# #3. Uses descriptive activity names to name the activities in the data set
# 3-1 read the activity file that contains the activity name into the table
activityData <- read.table("./UCI HAR Dataset/activity_labels.txt")
# 3-2 replace the merge Y data first column with the activity name
#head(allYData)
allYData[, 1] <- activityData[allYData[, 1], 2]

# #4. Appropriately labels the data set with descriptive variable names. 
# 4-1 labels extracted merge X data column name with descriptive variable names which is the feature name
names(allXData) <- gsub("\\(|\\)", "", (featuresData[featureIndexData, 2]))
# 4-2 labels merge Y and S data column name with descriptive variable names
names(allYData) <- "ACTIVITY"
names(allSubjectData) <- "SUBJECT"

#head(allXData)
#head(allYData)
#head(allSubjectData)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 5-1 compute the mean for the variables in the allXData, grouped according to
# the subject and activity in the allSubjectData and allYData
tidyData <- aggregate(allXData,list(allSubjectData$SUBJECT, allYData$ACTIVITY), mean)
names(tidyData)[1] <- "SUBJECT"
names(tidyData)[2] <- "ACTIVITY"
#head(tidyData)
#dim(tidyData)
# 5-2 write tidydata to a text file
write.table(tidyData, "tidy_data.txt", row.names = FALSE)




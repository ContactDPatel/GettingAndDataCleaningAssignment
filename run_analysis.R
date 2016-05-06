# Assignment: Getting and Cleaning Data Course Project

# 1. Merges the training and the test sets to create one data set.
xTrainData <- read.table("./data/train/X_train.txt")
yTrainData <- read.table("./data/train/y_train.txt")
subjectTrainData <- read.table("./data/train/subject_train.txt")

xTestData <- read.table("./data/test/X_test.txt")
yTestData <- read.table("./data/test/y_test.txt") 
subjectTestData <- read.table("./data/test/subject_test.txt")

joinXData <- rbind(xTrainData, xTestData)
joinYData <- rbind(yTrainData, yTestData)
joinSubjectData <- rbind(subjectTrainData, subjectTestData)


# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
featuresData <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", featuresData[, 2])
joinXData <- joinXData[, meanStdIndices]
names(joinXData) <- gsub("\\(\\)", "", featuresData[meanStdIndices, 2]) # remove "()"
names(joinXData) <- gsub("mean", "Mean", names(joinXData)) # capitalize M
names(joinXData) <- gsub("std", "Std", names(joinXData)) # capitalize S
names(joinXData) <- gsub("-", "", names(joinXData)) # remove "-" in column names 


# 3 Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./data/activity_labels.txt")
activityLabels[, 2] <- tolower(gsub("_", "", activityLabels[, 2]))
substr(activityLabels[2, 2], 8, 8) <- toupper(substr(activityLabels[2, 2], 8, 8))
substr(activityLabels[3, 2], 8, 8) <- toupper(substr(activityLabels[3, 2], 8, 8))
activityLabel <- activityLabels[joinYData[, 1], 2]
joinYData[, 1] <- activityLabel
names(joinYData) <- "activity"

# 4 Appropriately labels the data set with descriptive variable names.
names(joinSubjectData) <- "subject"
cleanData <- cbind(joinSubjectData, joinYData, joinXData)
write.table(cleanData, "MergeData.txt")


# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subjectDataLength <- length(table(joinSubjectData))
activityLabelsLength <- dim(activityLabels)[1]
columnLength <- dim(cleanData)[2]

resultData <- matrix(NA, nrow=subjectDataLength*activityLabelsLength, ncol=columnLength) 
resultData <- as.data.frame(resultData)
colnames(resultData) <- colnames(cleanData)
row <- 1
for(i in 1:subjectDataLength) {
    for(j in 1:activityLabelsLength) {
        resultData[row, 1] <- sort(unique(joinSubjectData)[, 1])[i]
        resultData[row, 2] <- activityLabels[j, 2]
        bool1 <- i == cleanData$subject
        bool2 <- activityLabels[j, 2] == cleanData$activity
        resultData[row, 3:columnLength] <- colMeans(cleanData[bool1&bool2, 3:columnLength])
        row <- row + 1
    }
}
head(resultData)
write.table(resultData, "DataWithMeans.txt")

# dataSample <- read.table("./DataWithMeans.txt")
# dataSample[1:12, 1:3]
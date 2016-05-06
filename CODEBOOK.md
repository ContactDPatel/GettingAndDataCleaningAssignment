# Getting and Cleaning Data Course Project CodeBook

## The data is obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The actual data was in zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Below are the detail steps performed to get the tidy data required for this assignment by usinf run_analysis.R script.

1) Read Training related data into xTrainData, yTrainData & subjectTrainData
2) Read actual Testing data into xTestData, yTestData & subjectTestData
3) Join Training & TEsting data into respective variables joinXData, joinYData & joinSubjectData
4) Read features.txt file into variable name featuresData. Get Standard and Mean deviation and rename the columns and join with joinXData.
5) Read activity_labels.txt file into variable name activityLabels. Rename the columns and join with joinYData.
6) Get the cleanData by joining joinSubjectData, joinYData & joinXData
7) Write the cleanData into "MergedData.txt" file.
8) Get the Column length for joinSubjectData, activityLabels
9) Generate a tidy data for each combination with a corrsponding mean for each measurement. These can be achived by looping thru each subject data and activty labels.
10) Write the tidy data into "DataWithMeans.txt" file.
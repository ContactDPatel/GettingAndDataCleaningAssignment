# This README file defines how all scripts works and they are connected

1) Get the Data Proejct zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2) Unzip file to the "data" folder by renaming the folder
3) Make sure to set R Studio's "Change Dir", where your "data" and "run_analysis.R" script exists
4) Run the "run_analysis.R" script by using command source("run_analysis.R")
5) At the end of this script run, it will produce two files 1) MergedData.txt & 2) DataWithMeans.txt
	MergedData.txt: It's an output of Clean Data File
	DataWithMean.txt: data set with the average of each variable for each activity and each subject
6) Read DataSample from DataWithMeans.txt file by using command 'DataSample <- read.table("./DataWithMeans.txt")
## run_analysis.R
##
## Assignment requirements:
##
## You should create one R script called run_analysis.R that does the following. 
## 1.) Merges the training and the test sets to create one data set.
## 2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.) Uses descriptive activity names to name the activities in the data set
## 4.) Appropriately labels the data set with descriptive activity names. 
## 5.) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##
## Data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Data must be unzipped in the same directory as this script.

library(reshape2)

## Load X tables, combine tables, and add column names (satisfies #1)
print("Looking for data in ./UCI HAR Dataset directory.")
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x.table <- rbind(x.train, x.test)
features <- read.table("./UCI HAR Dataset/features.txt")[,2]  ## use column 2 from table
names(x.table) <- features

## find the features with mean and standard deviation and include them in tidy data (satisfies #2)
features.mean <- grep("mean\\(\\)", features, value=TRUE)
features.std <- grep("std\\(\\)", features, value=TRUE)
features.extracted <- c(features.mean, features.std)
x.extracted <- x.table[, features.extracted]
names(x.extracted) <- tolower(gsub("\\(|\\)|-", "", names(x.extracted))) ## fix column names per week 4 lectures

## Load Y tables, combine, add column name
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y.table <- rbind(y.train, y.test)
names(y.table) <- "activityid"

## Read in activity lables and name the columns to prep for easier merge
y.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(y.labels) <- c("activityid", "activity")

## Merge the Y table and the activity labels so table includes meaningful activity names
y.activity <- merge(y.table, y.labels)["activity"]

## Add activity column to the extractedTable (satisfies #3, #4)
x.extracted <- cbind(x.extracted, y.activity)

## Write out table to CSV file of the extracted and merged data
print("Creating extracted dataset, extracted_measurements.txt")
write.csv(x.extracted, "extracted_measurements.txt")

## Read in the subject table data, bind the tables, and set the column name to subject
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject.table <- rbind(subject.train, subject.test)
colnames(subject.table) <- "subjectid"

## Add the subject to the extractedTable
x.extracted <- cbind(x.extracted, subject.table)

## setup variables to hold the column names for IDs and Measures
variables.id <- c("subjectid", "activity")
variables.measures <- setdiff(colnames(x.extracted), variables.id) ## everything minus ids

## melt the data and cast it (satisfies #5)
x.melt <- melt(x.extracted, id=variables.id, measure.vars=variables.measures)
x.tidy <- dcast(x.melt, subjectid + activity ~ variable, mean)

## write out the data to a file
print("Creating tidy dataset, tidy_data.txt")
write.csv(x.tidy, "tidy_data.txt")
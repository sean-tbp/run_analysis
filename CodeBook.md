## Code Book for run_analysis.R

Description of original data source project:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source data for the project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data must be downlaoded and unzipped into the same directory directory as run_analysis.R. Once unzipped, this directory should exist `./UCI HAR Dataset`

#### run_analysis does the following:
1. Loads the X train and X Test data and puts them into a single table
2. Lables the table using the information in features.txt file
3. Extracts only the columns of the table that hold either mean or standard divation by using a regular expression
  * `mean\\(\\)`
  * `std\\(\\)`
4. Change the column names to standard naming formats by using a regular expression and tolower() function
  * tolower(`gsub("\\(|\\)|-", "", names(x.extracted)))`
5. Load the Y train and Y test data which is the list of activities recorded
6. Transform the Y table into meaningful activity names
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
7. Save this data to the file `extracted_measurements.txt`
8. Load the subject ID information and add to the data table
9. Melt the data with the variables as the extracted measures
10. Cast the molten data into a table (data frame) that contains the mean for a measure for the subject and activity
11.  This "tidy" data set it saved as `tidy_data.txt`

#### tidy_data.txt contains the following variables:

subjectid              
activity                 
tbodyaccmeanx
tbodyaccmeany           
tbodyaccmeanz
tgravityaccmeanx
tgravityaccmeany
tgravityaccmeanz
tbodyaccjerkmeanx
tbodyaccjerkmeany
tbodyaccjerkmeanz
tbodygyromeanx        
tbodygyromeany
tbodygyromeanz
tbodygyrojerkmeanx
tbodygyrojerkmeany
tbodygyrojerkmeanz
tbodyaccmagmean
tgravityaccmagmean
tbodyaccjerkmagmean
tbodygyromagmean
tbodygyrojerkmagmean
fbodyaccmeanx
fbodyaccmeany
fbodyaccmeanz
fbodyaccjerkmeanx
fbodyaccjerkmeany
fbodyaccjerkmeanz
fbodygyromeanx
fbodygyromeany
fbodygyromeanz
fbodyaccmagmean
fbodybodyaccjerkmagmean
fbodybodygyromagmean
fbodybodygyrojerkmagmean
tbodyaccstdx     
tbodyaccstdy
tbodyaccstdz
tgravityaccstdx
tgravityaccstdy 
tgravityaccstdz
tbodyaccjerkstdx
tbodyaccjerkstdy
tbodyaccjerkstdz"        
tbodygyrostdx
tbodygyrostdy
tbodygyrostdz
tbodygyrojerkstdx
tbodygyrojerkstdy
tbodygyrojerkstdz
tbodyaccmagstd
tgravityaccmagstd
tbodyaccjerkmagstd
tbodygyromagstd
tbodygyrojerkmagstd
fbodyaccstdx  
fbodyaccstdy
fbodyaccstdz
fbodyaccjerkstdx
fbodyaccjerkstdy
fbodyaccjerkstdz
fbodygyrostdx
fbodygyrostdy
fbodygyrostdz
fbodyaccmagstd
fbodybodyaccjerkmagstd
fbodybodygyromagstd
fbodybodygyrojerkmagstd

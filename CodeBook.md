## Code Book for run_analysis.R

Description of original data source project:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source data for the project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data must be downlaoded and unzipped into the same directory directory as run_analysis.R. Once unzipped, this directory should exist `./UCI HAR Dataset`

#### run_analysis does the following:
1. Loads the X train and X Test data and puts them into a single table
2. Lables the table using the information in features.txt file
3. Extracts only the columns of the table that hold either mean or standard divation by using a regular expression
..* mean\\(\\)
..* std\\(\\)
4.

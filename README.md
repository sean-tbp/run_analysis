Getting and Cleaning Data, Course Project
============

This is my submission for the Cousera "Getting and Cleaning Data" course project

The run_analysis.R script uses a data set from the Samsung Galaxy S smartphone and provides a "tidy" data set.  The tidy data set is a merged data set of extracted measures and reformated column names.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Source data for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To use run_analysis.R:
* put zip download in the same directory as script
* unzip the data
* run the script

run_analysis.R will produce:
* extracted_measurements.txt, a 10299x68 csv file with extracted standard deviation and mean data
* tidy_data.txt, a 35x68 csv file containing the tidy data -- see CodeBook.md for details.



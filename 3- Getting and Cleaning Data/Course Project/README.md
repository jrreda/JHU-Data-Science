### Getting and Cleaning Data Course Project


## The purpose of this project

is to demonstrate your ability to:

1. collect, 

2. work with, 

3. clean a data set.



## The goal of this project 

is to prepare tidy data that can be used for later analysis.

You will be required to submit:

1) a tidy data set as described below.

2) a link to a Github repository with your script for performing the analysis.

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.



## About R script (Analysis Explained)

R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):

1. Reading datasets 
	. Reading train datasets (X_train, y_train, sub_train)
	. Reading test datasets (X_test, y_test, sub_test)
	. Reading data description (features.txt)

2. Merges the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement.
	. mean(): Mean value
	. std(): Standard deviation

4. Uses descriptive activity names to name the activities in the data set.

5. Appropriately labels the data set with descriptive variable names.

6. Creating a second, independent tidy data set with the average of each variable for each activity and each subject



### Source:
1.  A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
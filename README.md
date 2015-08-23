# Getting and Cleaning Data
## Introduction
The goal is to prepare tidy data from the data downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Create one R script called `run_analysis.R` that does the following:

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About this repository
This repository has the following files:
run_analysis.R - R script to create the tidy data set. This reqires data set that is already downloaded and unzipped.
get_data.R - R scipt to download the data set file and unzip it in the working directory. This file is required only if the data file is not manually downloaded and unzipped.
CodeBook.md - Description about the data set and explanation about how the data is transformed to tidy data set.

## Steps to create tidy data set

1. Clone this repository.
1. Set the desired working directory using setwd().
1. Run get_data.R to download and unzip the data.
1. Run run_analysis.R script.
The tidy data set text file will be created in the working directory you have set.

setwd("/media/sf_shared/data")
# Download the zip file
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="Dataset.zip")
# Unzip the file
unzip(zipfile="Dataset.zip",exdir=".")


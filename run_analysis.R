setwd("/media/sf_shared/data")
library(dplyr)
library(data.table)

file_path <- file.path(".", "UCI HAR Dataset")
# Read test data
featuresTestData <- read.table(file.path(file_path, "test", "X_test.txt"), header=FALSE)
activityTestData <- read.table(file.path(file_path, "test", "y_test.txt"), header=FALSE)
subjectTestData <- read.table(file.path(file_path, "test", "subject_test.txt"), header=FALSE)

# Read training data
featuresTrainingData <- read.table(file.path(file_path, "train", "X_train.txt"), header=FALSE)
activityTrainingData <- read.table(file.path(file_path, "train", "y_train.txt"), header=FALSE)
subjectTrainingData <- read.table(file.path(file_path, "train", "subject_train.txt"), header=FALSE)

# Merge the training and test datasets
featuresData <- rbind(featuresTrainingData, featuresTestData)
activityData <- rbind(activityTrainingData, activityTestData)
subjectData <- rbind(subjectTrainingData, subjectTestData)

# Get the labels
featureLabels <- read.table(file.path(file_path, "features.txt"), header=FALSE)

colnames(activityData) <- "activity"
colnames(subjectData) <- "subject"
colnames(featuresData) <- t(featureLabels[2])

# Merge all the columns to get the data frame with all data
data <- cbind(featuresData, activityData, subjectData)

# Get all the mean and standard deviation columns
colsMeanSTD <- grep(".*mean.*|.*std.*", names(data), ignore.case=TRUE)
# Check the columns
colsMeanSTD
# Add two more columns - activity and subject
colsRequired <- c(colsMeanSTD, 562, 563)
# check the required columns
colsRequired
# Extract the required columns from the 'data'
data <- data[, colsRequired]

# Add descriptive names for activities.
activityLabels <- read.table(file.path(file_path, "activity_labels.txt"), header=FALSE)
data$activity <- as.character(data$activity)
for (i in 1:6){
  data$activity[data$activity == i] <- as.character(activityLabels[i,2])
}
data$activity <- as.factor(data$activity)
# Check the names of columns in 'data'
names(data)
# Labelling the dataset with descriptive names
names(data)<-gsub("-mean()", "mean", names(data))
names(data)<-gsub("-STD()", "STD", names(data))
names(data)<-gsub("-freq()", "frequency", names(data))
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "accelerometer", names(data))
names(data)<-gsub("Gyro", "gyroscope", names(data))
names(data)<-gsub("Mag", "magnitude", names(data))
names(data)<-gsub("BodyBody", "body", names(data))
# Check the names of columns in 'data
names(data)
# Create tidy data set
data$subject <- as.factor(data$subject)
data <- data.table(data)
tidy <- aggregate(. ~subject + activity, data, mean)
tidy <- tidy[order(tidy$subject,tidy$activity),]
write.table(tidy, file = "tidy_data.txt", row.names = FALSE)

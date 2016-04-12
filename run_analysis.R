# download file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destinationfile <- "./dataset/dataset.zip"
download.file(fileURL,destinationfile,method="curl")
unzip(zipfile="./dataset/dataset.zip",exdir="./dataset")
dataset <- file.path("./dataset" , "UCI HAR Dataset")

#library(data.table)
subjectTrain <- read.table(file.path(dataset, "train", "subject_train.txt"),header = FALSE)
subjectTest  <- read.table(file.path(dataset, "test" , "subject_test.txt"),header = FALSE)

featuresName <- read.table(file.path(dataset, "features.txt"),header = FALSE)
activityLabels <- read.table(file.path(dataset, "activity_labels.txt"),header = FALSE)
  
activityTest  <- read.table(file.path(dataset, "test" , "Y_test.txt" ),header = FALSE)
activityTrain <- read.table(file.path(dataset, "train", "Y_train.txt"),header = FALSE)

featuresTest  <- read.table(file.path(dataset, "test" , "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(dataset, "train", "X_train.txt"),header = FALSE)

# Part 1 - Merges the training and the test sets to create one data set.

subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

colnames(features) <- t(featuresName[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)

# review data set
str(completeData)
nrow(completeData)
ncol(completeData)

# Part 2 - Extracts only the measurements on the mean and 
# standard deviation for each measurement
AddMeans <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
requiredCol <- c(AddMeans, 562, 563)
extractedMeanSD <- completeData[,requiredCol]

#review data set
dim(extractedMeanSD)

# Part 3 - Uses descriptive activity names to name the activities in the data set
extractedMeanSD$Activity <- as.character(extractedMeanSD$Activity)
for (i in 1:6){
  extractedMeanSD$Activity[extractedMeanSD$Activity == i] <- as.character(activityLabels[i,2])
}

extractedMeanSD$Activity <- as.factor(extractedMeanSD$Activity)

# Part 4 - Appropriately labels the data set with descriptive variable names
names(extractedMeanSD)

names(extractedMeanSD) <- gsub("Acc", "Accelerator", names(extractedMeanSD))
names(extractedMeanSD) <- gsub("Mag", "Magnitude", names(extractedMeanSD))
names(extractedMeanSD) <- gsub("Gyro", "Gyroscope", names(extractedMeanSD))
names(extractedMeanSD) <- gsub("^t", "time", names(extractedMeanSD))
names(extractedMeanSD) <- gsub("^f", "frequency", names(extractedMeanSD))

# review part 4
names(extractedMeanSD)

# Part 5 - From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
resultData <- aggregate(. ~Subject + Activity, extractedMeanSD, mean)
resultData <- resultData[order(resultData$Subject,resultData$Activity),]

write.table(resultData, "resultData.txt", row.name=FALSE)





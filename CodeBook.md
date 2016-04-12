##CodeBook
This CodeBook describes the code inside `run_analysis.R`.

5 steps to describe the working process in this file

<li>download source file from `fileURL` to `destinationfile`</li>
<li>load the data set into one using `read.table`</li>
<li>merge the data set into one using `rbind`</li>
<li>Uses descriptive activity names to name and label the data names by using function like `names`</li>
<li>Generate a new dataset with all average mesaures for each subject and activity type. Using `write.table` to export the output file called `resultData.txt`</li>

##Variables
<li>`fileURL` - Data source: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  which provided from course instruction</li> 

##`run_analysis.R` contains the following variables
<li>`destinationfile` - the data source destination path</li>
<li>`dataset` - the data file path</li>
<li>`subjectTrain`, `subjectTest`, `featuresName`, `activityLabels`, `activityTest`, `activityTrain`, `featuresTest`, `featuresTrain` - contain the data from the downloaded files </li>
<li>`subject`,`activity`,`features` - Merges the training and the test sets to create one data set.</li>
<li>`completeData` - Merges the `subject`,`activity`,`features` set to create one data set</li>
<li>`AddMeans` - Indentifies the mean and standard deviation columns
<li>`requiredCol` ,`extractedMeanSD` - extracts the </li>
<li>`resultData` - contains the relevant averages </li>
<li>`resultData.txt` - export the `resultData` to current working directory</li>


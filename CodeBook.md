##CodeBook
This CodeBook describes the code inside `run_analysis.R`.
<li>download source file</li>
<li>download source file</li>
<li>download source file</li>
<li>download source file</li>
<li>download source file</li><li>download source file</li>

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



##Summaries calculated

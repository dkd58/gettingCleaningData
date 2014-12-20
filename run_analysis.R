# Course Project Analysis Script

# 1. Data download and unpacking.
#
# Obtain the data if not present and unpack it.
# The ZIP file download is stored in the "download" sub-directory, the 
# ZIP file is then unpacked so that its contents will reside in the 
# "UCI HAR Dataset" sub-directory.
dir <- "download"
srcUrl <- 
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- paste(dir, "dataset.zip", sep="/")
uciDir <- "UCI HAR Dataset"

if (!file.exists(uciDir)) {
    if (!file.exists(dir)) 
        dir.create(dir)
    if (!file.exists(zipFile))
        download.file(srcUrl, zipFile, method="curl", quiet=T)
    unzip(zipFile)   
}

# 2. Read the source data.
#
# Read the column and data label files and the actual data sets.
# Filenames as given by the source data README file.
featuresFile <- paste(uciDir, "features.txt", sep="/")
activitiesFile <- paste(uciDir, "activity_labels.txt", sep="/")
trainActivitiesFile <- paste(uciDir, "train", "y_train.txt", sep="/")
trainDataFile <- paste(uciDir, "train", "X_train.txt", sep="/")
trainSubjectsFile <- paste(uciDir, "train", "subject_train.txt", sep="/")
testActivitiesFile <- paste(uciDir, "test", "y_test.txt", sep="/")
testDataFile <- paste(uciDir, "test", "X_test.txt", sep="/")
testSubjectsFile <- paste(uciDir, "test", "subject_test.txt", sep="/")

features <- read.table(featuresFile,
                       col.names=c("ID", "Name"),
                       colClasses=c("integer", "factor"))
activities <- read.table(activitiesFile,
                         col.names=c("ID", "Name"),
                         colClasses=c("integer", "factor"))
trainActivities <- read.table(trainActivitiesFile,
                              col.names="ID",
                              colClasses="integer")
trainData <- read.table(trainDataFile, colClasses="numeric")
trainSubjects <- read.table(trainSubjectsFile, 
                            col.names="SubjectID",
                            colClasses="integer")
testActivities <- read.table(testActivitiesFile,
                             col.names="ID",
                             colClasses="integer")
testData <- read.table(testDataFile, colClasses="numeric")
testSubjects <- read.table(testSubjectsFile, 
                           col.names="SubjectID",
                           colClasses="integer")


# 3. Produce a tidy data set.

# 3.1 Combine the train and test data sets.
allActivities <- rbind(trainActivities, testActivities)
allData <- rbind(trainData, testData)
allSubjects <- rbind(trainSubjects, testSubjects)

# 3.2 Extract mean and std (deviation) columns by matching feature names.
cols <- grep("(mean|std)\\(\\)", features$Name)
allData <- allData[,cols]

# 3.3 Apply column names.
# Note that the columns have already been reduced to those with mean
# or std. Thus, only those names have to be used.
colnames(allData) <- features$Name[cols]

# 3.4 Add labels to activity codes.
# Apply the labels given in activitiy_labels.txt to the activity columns.
allActivities$Name <- factor(allActivities$ID, 
                             levels=activities$ID, 
                             labels=activities$Name)

# 3.5 Create the tidy data set.
# Combine the subjects, activities and the filtered data set to
# form the tidy data set.
data <- cbind(Subject=allSubjects$SubjectID, 
              Activity=allActivities$Name, 
              allData)

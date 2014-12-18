# Data download.

# Obtain the data if not present and unpack it.
dir <- "download"
if (!file.exists(dir)) 
    dir.create(dir)
srcUrl <- 
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- paste(dir, "dataset.zip", sep="/")
if(!file.exists(zipFile)) {
    download.file(srcUrl, zipFile, method="curl", quiet=T)
    unzip(zipFile)   
}

# Course Project Analysis Script

# I. Data download and unpacking.
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

if (!file.exists(dir)) 
    dir.create(dir)
if (!file.exists(zipFile))
    download.file(srcUrl, zipFile, method="curl", quiet=T)
if (!file.exists(uciDir))
    unzip(zipFile)   

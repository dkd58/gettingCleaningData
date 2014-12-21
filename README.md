# Getting and Cleaning Data Course Project

The contents of this project directory are the files required for the
Coursera Getting and Cleaning Data Course Project. These are
* **README.md** (this file)
* **run_analysis.R**: the R script file that produces the tidy data sets
* **CodeBook.md**: the code book describing the data and transformations
executed by the R script.

Not included are the source data and the tidy data set itself. The latter
has been uploaded to the Course Project site as **tidy.txt**.


## run_analysis.R script

The R script expects the source data set to be available in the current working
directory within the directory structure found in the source ZIP file.
**run_analysis.R** actually looks for the directory `UCI HAR Dataset` in the
current working directory. If this directory is not found, the script will
download the ZIP file into a sub-directory `download` and then unpack the
ZIP file.

The R script then reads the source data, produces both tidy data sets and
finally stores the tidy data set required in step 5 of the assignment
as **tidy.txt** in the current working directory.


## tidy.txt data set

The tidy data set has been saved from R as required via write.table() without
row names. To read the tidy data set back into R, save the file as **tidy.txt**
and use the following command:

    tidy <- read.table("tidy.txt", header=T)

# Getting and Cleaning Data Course Project Codebook

The data set produced in the scope of this Course Project is based on
a source data set of smartphone sensor data published in [1]. The source data
set is available for download [2].


## Source data set

The source data contains aggregated sensor measurements obtained for 30
subjects while these were executing six different activities.
The raw measurements have already been pre-processed in [1], the source data
for this assignment is the pre-processed data.
The source data is spread across several tables each stored in a text file.
The data relevant for the Course Project assignment is contained in the
following source files:
* **features.txt**: the sensor features, giving the column names for the actual
data sets.
* **activity_labels.txt**: labels for the six activities executed by the
subjects, giving a label to the activity ID used in the data sets.
* **train/y_train.txt** and **test/y_test.txt**: the activity ID column of the
data sets.
* **train/X_train.txt** and **test/X_test.txt**: the pre-processed
sensor data columns of the data sets.
* **train/subject_train.txt** and **test/subject_test.txt**: the subject ID
column of the data sets.


## Data set transformation

The source data set has been provided in six different text files (see above),
as the activity and subject columns have been moved to separate files.
The data set has also been split randomly into a training and a test dataset.

This (pre-processed) source data is transformed by the R script
**run_analysis.R** into two sets of tidy data.
The first part of data transformation re-constructs a tidy sub-set of data from
these separate data frames. The second part of transformation uses that tidy
sub-set and produces average values for its observations.


### Construction of a tidy data sub-set

The first transformation step re-combines the training and test data sets by
appending the rows of each to form three completed data.frames.

The second step extracts only the mean and standard deviation columns from
the combined sensor data set. This selection is limited to the variables
where the mean is determined for several observations, but not the variables
that represent additional signal averages labeled also as "...Mean". Thus,
mean and standard deviation (std) are present in pairs for each sensor
measurement.

Column names that give the name of the aggregated sensor value are added to
the data set in the third step.

The fourth transformation determines the activity labels for the ID values
given by the combined activity column.

Finally, the fifth transformation produces a tidy data set consisting of
single data frame for the selected sub-set of sensor data together with
the corresponding subject and activity columns. Thus, each of the variables of
interest is stored in a single column and each row contains an observation
of these variables.

This data set is stored in the R variable `data` and contains 10299 observations
of 69 variables. These are
* **Subject**: the subject ID identifying the person using the smartphone
within the data set.
* **Activity**: the descriptive activity name executed in this observation.
* **ActivityID**: the numeric activity ID for later reference.
* **66 sensor columns**. These consist of 3-axial data with three column
names ending X, Y and Z, and scalar magnitude data ending in Mag. For each
of these sensors, a mean and std value is provided.
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag


### Derivation of mean sensor data by subject and activity

The second part of the transformation uses the data set produced in the first
part as its source. Three transformation steps give an aggregated data set
as follows

Firstly, the data set is split into 180 sub-sets by its 30 subjects and
6 activities.

For each of these sub-sets, the average (mean) value for each of the 66 sensor
data values is determined in the second step.

Finally, these rows of averages are combined into a single data frame
together with the corresponding subject and activity columns.

The resulting data set of 180 observations of 68 variables is store in the
R variable `tidy` as well as in the file **tidy.txt**.

Except for the activity ID column not included in this `tidy` data set,
the column names are identical with those of the `data` set presented above.
The observations in `tidy`, of course, represent the average values of those
observations in the `data` set.


## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. _Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine._
International Workshop of Ambient Assisted Living (IWAAL 2012).
Vitoria-Gasteiz, Spain. Dec 2012

[2] _Human Activity Recognition Using Smartphones Data Set_ web site
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

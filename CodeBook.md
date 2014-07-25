# CodeBook

## Variables

### Main Vars
* `data` : result of  "extracts only the measurements on the mean and standard deviation for each measurement"
* `summary` : a second, independent tidy data set with the average of each variable for each activity and each subject form 'data'.
* `summary2`: a second, independent tidy data set with the average of each variable for each activity and each subject from 'x'.


### Others Vars
* `test` and `train` : temp vars for read test/*_test.txt and train/*_train.txt. 
* `x` : raw data form test/X_test.txt and train/X_train.txt
* `y` : raw data form test/y_test.txt and train/y_train.txt
* `s` : raw data form test/subject_test.txt and train/subject_train.txt
* `condi` : for  "extracts only the measurements on the mean and standard deviation for each measurement"
* `lbls` and `act` : temp vars for "Uses descriptive activity names to name the activities in the data set"



## Output

### tidy-1.txt 
result of:
   * Merges the training and the test sets to create one data set.
   * Extracts only the measurements on the mean and standard deviation for each measurement. 
   * Uses descriptive activity names to name the activities in the data set
   * Appropriately labels the data set with descriptive variable names. 


### tidy-2-mean_std_only.txt
a tidy data set with the average of each variable for each activity and each subject form 'data (or tidy-1.txt)'.

It is extracted only the measurements on the mean and standard deviation for each measurement.


### tidy-2-all.txt
a tidy data set with the average of each variable for each activity and each subject form 'x (or test/X_test.txt and train/X_train.txt)'.

It is Not extracted.

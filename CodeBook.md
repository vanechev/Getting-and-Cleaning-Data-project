#Review
This repo contains a script called 'run_analysis.R' that performs the following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Merging the training and the test sets to create one data set.
In order to merge different files containing train and test data, 'cbind' and 'rbind' functions were used to gather all data in one data frame.
Also, new names were assigned to variables.
- `features`: load in a table all data from 'features.txt'
- `activity_class`: load in a table all data from 'activity_labels.txt'
- `subject_train`: load in a table all data from 'subject_train.txt'
- `x_train`: load in a table all data from 'x_train.txt'
- `y_train`: load in a table all data from 'y_train.txt'
- `subject_test`: load in a table all data from 'subject_test.txt'
- `x_test`: load in a table all data from 'x_test.txt'
- `y_test`: load in a table all data from 'y_test.txt'
- `subject`: merge all train and test subjects (subject_train + subject_test)
- `X`: merge all train and test X (X_train + X_test)
- `Y`: merge all train and test Y (Y_train + Y_test)
- `data_subject_class`: merge columns from subject and Y tables.
- `data`: merge columns from data_subject_class and X tables.
The final data frame has 10299 observations with 563 variables.

## Extracting only the measurements on the mean and standard deviation for each measurement.
Once that all data was located in a data frame, a subset of this was selected including all variables that has the strings 'mean' and 'std' as column names. Only 68 variables were selected from original dataset.
```
'data.frame':	10299 obs. of  68 variables:
 $ subject                    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ class                      : int  5 5 5 5 5 5 5 5 5 5 ...
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean()-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ tBodyAcc-std()-X           : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ tBodyAcc-std()-Y           : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ tBodyAcc-std()-Z           : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ tGravityAcc-mean()-X       : num  0.963 0.967 0.967 0.968 0.968 ...
 $ tGravityAcc-mean()-Y       : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
 $ tGravityAcc-mean()-Z       : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
 $ tGravityAcc-std()-X        : num  -0.985 -0.997 -1 -0.997 -0.998 ...
 $ tGravityAcc-std()-Y        : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
 $ tGravityAcc-std()-Z        : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
 $ tBodyAccJerk-mean()-X      : num  0.078 0.074 0.0736 0.0773 0.0734 ...
 $ tBodyAccJerk-mean()-Y      : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
 $ tBodyAccJerk-mean()-Z      : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
 $ tBodyAccJerk-std()-X       : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
 $ tBodyAccJerk-std()-Y       : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
 $ tBodyAccJerk-std()-Z       : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
 $ tBodyGyro-mean()-X         : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
 $ tBodyGyro-mean()-Y         : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
 $ tBodyGyro-mean()-Z         : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
 $ tBodyGyro-std()-X          : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
 $ tBodyGyro-std()-Y          : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
 $ tBodyGyro-std()-Z          : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
 $ tBodyGyroJerk-mean()-X     : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
 $ tBodyGyroJerk-mean()-Y     : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
 $ tBodyGyroJerk-mean()-Z     : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
 $ tBodyGyroJerk-std()-X      : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
 $ tBodyGyroJerk-std()-Y      : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
 $ tBodyGyroJerk-std()-Z      : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
 $ tBodyAccMag-mean()         : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ tBodyAccMag-std()          : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ tGravityAccMag-mean()      : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ tGravityAccMag-std()       : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ tBodyAccJerkMag-mean()     : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
 $ tBodyAccJerkMag-std()      : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
 $ tBodyGyroMag-mean()        : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
 $ tBodyGyroMag-std()         : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
 $ tBodyGyroJerkMag-mean()    : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
 $ tBodyGyroJerkMag-std()     : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
 $ fBodyAcc-mean()-X          : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
 $ fBodyAcc-mean()-Y          : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
 $ fBodyAcc-mean()-Z          : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
 $ fBodyAcc-std()-X           : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
 $ fBodyAcc-std()-Y           : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
 $ fBodyAcc-std()-Z           : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
 $ fBodyAccJerk-mean()-X      : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
 $ fBodyAccJerk-mean()-Y      : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
 $ fBodyAccJerk-mean()-Z      : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
 $ fBodyAccJerk-std()-X       : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
 $ fBodyAccJerk-std()-Y       : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
 $ fBodyAccJerk-std()-Z       : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
 $ fBodyGyro-mean()-X         : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
 $ fBodyGyro-mean()-Y         : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
 $ fBodyGyro-mean()-Z         : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
 $ fBodyGyro-std()-X          : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
 $ fBodyGyro-std()-Y          : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
 $ fBodyGyro-std()-Z          : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
 $ fBodyAccMag-mean()         : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
 $ fBodyAccMag-std()          : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
 $ fBodyBodyAccJerkMag-mean() : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
 $ fBodyBodyAccJerkMag-std()  : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
 $ fBodyBodyGyroMag-mean()    : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
 $ fBodyBodyGyroMag-std()     : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
 $ fBodyBodyGyroJerkMag-mean(): num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
 $ fBodyBodyGyroJerkMag-std() : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
 ```
## Using descriptive activity names to name the activities in the data set
Because of renaming variables from previous step, activity names were merged within the data frame. Now, in order to have the activity number for each observation, the activity name replaced that number.

## Appropriately labels the data set with descriptive variable names
Variable names had non descriptive variable names. They were replaced by new strings depending of the measure of the variable:
- Mean was changed by mean
- std was changed by StdDev
- f was changed by frequency
- t was changed by time
- gyro was changed by gyroscope
- acc was changed by acceloremeter

```
'data.frame':	10299 obs. of  68 variables:
 $ subject                                         : int  1 1 1 1 1 1 1 1 1 1 ...
 $ timeBodyAccelerometer-Mean()-X                  : num  0.233 0.349 0.326 0.22 0.272 ...
 $ timeBodyAccelerometer-Mean()-Y                  : num  0.00609 -0.00929 -0.03043 -0.02154 0.00388 ...
 $ timeBodyAccelerometer-Mean()-Z                  : num  -0.1096 -0.0484 -0.0904 -0.1507 -0.0537 ...
 $ timeBodyAccelerometer-StdDev()-X                : num  -0.336 -0.296 -0.324 -0.282 -0.315 ...
 $ timeBodyAccelerometer-StdDev()-Y                : num  0.00957 0.18386 0.18395 0.19934 0.07491 ...
 $ timeBodyAccelerometer-StdDev()-Z                : num  -0.332 -0.341 -0.333 -0.311 -0.335 ...
 $ timeGravityAccelerometer-Mean()-X               : num  0.927 0.934 0.929 0.936 0.935 ...
 $ timeGravityAccelerometer-Mean()-Y               : num  -0.306 -0.302 -0.295 -0.297 -0.305 ...
 $ timeGravityAccelerometer-Mean()-Z               : num  -0.1063 -0.1079 -0.0966 -0.0972 -0.1149 ...
 $ timeGravityAccelerometer-StdDev()-X             : num  -0.962 -0.978 -0.981 -0.975 -0.984 ...
 $ timeGravityAccelerometer-StdDev()-Y             : num  -0.986 -0.976 -0.978 -0.971 -0.99 ...
 $ timeGravityAccelerometer-StdDev()-Z             : num  -0.955 -0.923 -0.963 -0.955 -0.963 ...
 $ timeBodyAccelerometerJerk-Mean()-X              : num  -0.19776 -0.00523 -0.24611 0.24126 0.42027 ...
 $ timeBodyAccelerometerJerk-Mean()-Y              : num  0.124 -0.332 -0.56 0.375 0.309 ...
 $ timeBodyAccelerometerJerk-Mean()-Z              : num  0.3547 -0.0922 -0.3158 -0.1145 0.1058 ...
 $ timeBodyAccelerometerJerk-StdDev()-X            : num  -0.205 -0.0993 -0.1341 0.012 -0.1534 ...
 $ timeBodyAccelerometerJerk-StdDev()-Y            : num  -0.0702 0.1669 0.1664 0.0877 0.0292 ...
 $ timeBodyAccelerometerJerk-StdDev()-Z            : num  -0.549 -0.528 -0.517 -0.498 -0.512 ...
 $ timeBodyGyroscope-Mean()-X                      : num  -0.0237 -0.01166 -0.01058 0.0031 -0.00995 ...
 $ timeBodyGyroscope-Mean()-Y                      : num  0.0969 -0.0527 -0.1138 -0.1623 -0.0749 ...
 $ timeBodyGyroscope-Mean()-Z                      : num  0.1499 0.0758 0.1258 0.1043 0.0816 ...
 $ timeBodyGyroscope-StdDev()-X                    : num  -0.584 -0.484 -0.509 -0.495 -0.531 ...
 $ timeBodyGyroscope-StdDev()-Y                    : num  -0.1155 -0.1325 -0.1499 -0.0481 -0.1515 ...
 $ timeBodyGyroscope-StdDev()-Z                    : num  -0.412 -0.422 -0.43 -0.358 -0.41 ...
 $ timeBodyGyroscopeJerk-Mean()-X                  : num  -0.13234 0.00866 0.0216 -0.05399 -0.19614 ...
 $ timeBodyGyroscopeJerk-Mean()-Y                  : num  -0.3552 0.0767 -0.1965 0.1738 -0.1443 ...
 $ timeBodyGyroscopeJerk-Mean()-Z                  : num  0.0294 -0.0789 -0.1451 0.0356 0.0754 ...
 $ timeBodyGyroscopeJerk-StdDev()-X                : num  -0.336 -0.19 -0.18 -0.228 -0.261 ...
 $ timeBodyGyroscopeJerk-StdDev()-Y                : num  -0.38 -0.326 -0.342 -0.241 -0.325 ...
 $ timeBodyGyroscopeJerk-StdDev()-Z                : num  -0.457 -0.453 -0.474 -0.389 -0.444 ...
 $ timeBodyAccelerometerMagnitude-Mean()           : num  -0.2 -0.138 -0.157 -0.123 -0.178 ...
 $ timeBodyAccelerometerMagnitude-StdDev()         : num  -0.328 -0.234 -0.241 -0.209 -0.271 ...
 $ timeGravityAccelerometerMagnitude-Mean()        : num  -0.2 -0.138 -0.157 -0.123 -0.178 ...
 $ timeGravityAccelerometerMagnitude-StdDev()      : num  -0.328 -0.234 -0.241 -0.209 -0.271 ...
 $ timeBodyAccelerometerJerkMagnitude-Mean()       : num  -0.2511 -0.1095 -0.1292 -0.0982 -0.1899 ...
 $ timeBodyAccelerometerJerkMagnitude-StdDev()     : num  -0.1467 -0.0456 -0.0465 0.061 -0.0758 ...
 $ timeBodyGyroscopeMagnitude-Mean()               : num  -0.259 -0.236 -0.245 -0.196 -0.282 ...
 $ timeBodyGyroscopeMagnitude-StdDev()             : num  -0.254 -0.226 -0.286 -0.136 -0.196 ...
 $ timeBodyGyroscopeJerkMagnitude-Mean()           : num  -0.387 -0.313 -0.324 -0.275 -0.34 ...
 $ timeBodyGyroscopeJerkMagnitude-StdDev()         : num  -0.4 -0.346 -0.351 -0.259 -0.332 ...
 $ frequencyBodyAccelerometer-Mean()-X             : num  -0.229 -0.21 -0.229 -0.169 -0.203 ...
 $ frequencyBodyAccelerometer-Mean()-Y             : num  0.0306 0.1682 0.2732 0.1841 0.0683 ...
 $ frequencyBodyAccelerometer-Mean()-Z             : num  -0.366 -0.417 -0.354 -0.366 -0.433 ...
 $ frequencyBodyAccelerometer-StdDev()-X           : num  -0.383 -0.333 -0.366 -0.332 -0.364 ...
 $ frequencyBodyAccelerometer-StdDev()-Y           : num  -0.0659 0.1173 0.0575 0.1315 0.0105 ...
 $ frequencyBodyAccelerometer-StdDev()-Z           : num  -0.366 -0.352 -0.374 -0.335 -0.335 ...
 $ frequencyBodyAccelerometerJerk-Mean()-X         : num  -0.2431 -0.1413 -0.1987 -0.0763 -0.188 ...
 $ frequencyBodyAccelerometerJerk-Mean()-Y         : num  -0.11667 0.06441 0.06684 0.00982 -0.03852 ...
 $ frequencyBodyAccelerometerJerk-Mean()-Z         : num  -0.525 -0.516 -0.491 -0.476 -0.498 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-X       : num  -0.2352 -0.1348 -0.1429 0.0142 -0.192 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-Y       : num  -0.081 0.2022 0.1987 0.1014 0.0356 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-Z       : num  -0.57 -0.538 -0.54 -0.516 -0.524 ...
 $ frequencyBodyGyroscope-Mean()-X                 : num  -0.468 -0.372 -0.417 -0.397 -0.399 ...
 $ frequencyBodyGyroscope-Mean()-Y                 : num  -0.1782 -0.12 -0.1631 -0.0639 -0.1675 ...
 $ frequencyBodyGyroscope-Mean()-Z                 : num  -0.305 -0.322 -0.366 -0.252 -0.31 ...
 $ frequencyBodyGyroscope-StdDev()-X               : num  -0.621 -0.52 -0.539 -0.527 -0.573 ...
 $ frequencyBodyGyroscope-StdDev()-Y               : num  -0.0851 -0.1464 -0.1478 -0.0453 -0.1477 ...
 $ frequencyBodyGyroscope-StdDev()-Z               : num  -0.505 -0.511 -0.504 -0.456 -0.501 ...
 $ frequencyBodyAccelerometerMagnitude-Mean()      : num  -0.2687 -0.1708 -0.1748 -0.0845 -0.1638 ...
 $ frequencyBodyAccelerometerMagnitude-StdDev()    : num  -0.468 -0.39 -0.398 -0.411 -0.452 ...
 $ frequencyBodyAccelerometerJerkMagnitude-Mean()  : num  -0.1557 -0.014 -0.0504 0.0801 -0.0677 ...
 $ frequencyBodyAccelerometerJerkMagnitude-StdDev(): num  -0.1412 -0.0921 -0.034 0.0307 -0.0927 ...
 $ frequencyBodyGyroscopeMagnitude-Mean()          : num  -0.235 -0.195 -0.296 -0.115 -0.194 ...
 $ frequencyBodyGyroscopeMagnitude-StdDev()        : num  -0.4 -0.389 -0.403 -0.305 -0.338 ...
 $ frequencyBodyGyroscopeJerkMagnitude-Mean()      : num  -0.386 -0.327 -0.33 -0.238 -0.329 ...
 $ frequencyBodyGyroscopeJerkMagnitude-StdDev()    : num  -0.463 -0.418 -0.427 -0.342 -0.381 ...
 $ act_name                                        : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
```
## Independent tidy data with the average for activity and subject
The 'aggregate' function performs the average function according to the activity and subject. Finally, a new dataset is written in a file called 'tidy2.txt'
```
'data.frame':	180 obs. of  68 variables:
 $ subject                                         : int  1 2 3 4 5 6 7 8 9 10 ...
 $ label                                           : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ timeBodyAccelerometer-Mean()-X                  : num  0.222 0.281 0.276 0.264 0.278 ...
 $ timeBodyAccelerometer-Mean()-Y                  : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
 $ timeBodyAccelerometer-Mean()-Z                  : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
 $ timeBodyAccelerometer-StdDev()-X                : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
 $ timeBodyAccelerometer-StdDev()-Y                : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...
 $ timeBodyAccelerometer-StdDev()-Z                : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
 $ timeGravityAccelerometer-Mean()-X               : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...
 $ timeGravityAccelerometer-Mean()-Y               : num  0.706 0.753 0.837 0.915 0.955 ...
 $ timeGravityAccelerometer-Mean()-Z               : num  0.446 0.647 0.489 0.342 0.264 ...
 $ timeGravityAccelerometer-StdDev()-X             : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...
 $ timeGravityAccelerometer-StdDev()-Y             : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...
 $ timeGravityAccelerometer-StdDev()-Z             : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...
 $ timeBodyAccelerometerJerk-Mean()-X              : num  0.0811 0.0826 0.077 0.0934 0.0848 ...
 $ timeBodyAccelerometerJerk-Mean()-Y              : num  0.00384 0.01225 0.0138 0.00693 0.00747 ...
 $ timeBodyAccelerometerJerk-Mean()-Z              : num  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...
 $ timeBodyAccelerometerJerk-StdDev()-X            : num  -0.958 -0.986 -0.981 -0.978 -0.983 ...
 $ timeBodyAccelerometerJerk-StdDev()-Y            : num  -0.924 -0.983 -0.969 -0.942 -0.965 ...
 $ timeBodyAccelerometerJerk-StdDev()-Z            : num  -0.955 -0.988 -0.982 -0.979 -0.985 ...
 $ timeBodyGyroscope-Mean()-X                      : num  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ...
 $ timeBodyGyroscope-Mean()-Y                      : num  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...
 $ timeBodyGyroscope-Mean()-Z                      : num  0.149 0.145 0.138 0.17 0.16 ...
 $ timeBodyGyroscope-StdDev()-X                    : num  -0.874 -0.988 -0.975 -0.973 -0.979 ...
 $ timeBodyGyroscope-StdDev()-Y                    : num  -0.951 -0.982 -0.977 -0.961 -0.977 ...
 $ timeBodyGyroscope-StdDev()-Z                    : num  -0.908 -0.96 -0.964 -0.962 -0.961 ...
 $ timeBodyGyroscopeJerk-Mean()-X                  : num  -0.107 -0.102 -0.1 -0.105 -0.102 ...
 $ timeBodyGyroscopeJerk-Mean()-Y                  : num  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...
 $ timeBodyGyroscopeJerk-Mean()-Z                  : num  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...
 $ timeBodyGyroscopeJerk-StdDev()-X                : num  -0.919 -0.993 -0.98 -0.975 -0.983 ...
 $ timeBodyGyroscopeJerk-StdDev()-Y                : num  -0.968 -0.99 -0.987 -0.987 -0.984 ...
 $ timeBodyGyroscopeJerk-StdDev()-Z                : num  -0.958 -0.988 -0.983 -0.984 -0.99 ...
 $ timeBodyAccelerometerMagnitude-Mean()           : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
 $ timeBodyAccelerometerMagnitude-StdDev()         : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
 $ timeGravityAccelerometerMagnitude-Mean()        : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
 $ timeGravityAccelerometerMagnitude-StdDev()      : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
 $ timeBodyAccelerometerJerkMagnitude-Mean()       : num  -0.954 -0.988 -0.979 -0.97 -0.98 ...
 $ timeBodyAccelerometerJerkMagnitude-StdDev()     : num  -0.928 -0.986 -0.976 -0.961 -0.977 ...
 $ timeBodyGyroscopeMagnitude-Mean()               : num  -0.875 -0.95 -0.952 -0.93 -0.947 ...
 $ timeBodyGyroscopeMagnitude-StdDev()             : num  -0.819 -0.961 -0.954 -0.947 -0.958 ...
 $ timeBodyGyroscopeJerkMagnitude-Mean()           : num  -0.963 -0.992 -0.987 -0.985 -0.986 ...
 $ timeBodyGyroscopeJerkMagnitude-StdDev()         : num  -0.936 -0.99 -0.983 -0.983 -0.984 ...
 $ frequencyBodyAccelerometer-Mean()-X             : num  -0.939 -0.977 -0.981 -0.959 -0.969 ...
 $ frequencyBodyAccelerometer-Mean()-Y             : num  -0.867 -0.98 -0.961 -0.939 -0.965 ...
 $ frequencyBodyAccelerometer-Mean()-Z             : num  -0.883 -0.984 -0.968 -0.968 -0.977 ...
 $ frequencyBodyAccelerometer-StdDev()-X           : num  -0.924 -0.973 -0.984 -0.952 -0.965 ...
 $ frequencyBodyAccelerometer-StdDev()-Y           : num  -0.834 -0.981 -0.964 -0.946 -0.973 ...
 $ frequencyBodyAccelerometer-StdDev()-Z           : num  -0.813 -0.985 -0.963 -0.962 -0.966 ...
 $ frequencyBodyAccelerometerJerk-Mean()-X         : num  -0.957 -0.986 -0.981 -0.979 -0.983 ...
 $ frequencyBodyAccelerometerJerk-Mean()-Y         : num  -0.922 -0.983 -0.969 -0.944 -0.965 ...
 $ frequencyBodyAccelerometerJerk-Mean()-Z         : num  -0.948 -0.986 -0.979 -0.975 -0.983 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-X       : num  -0.964 -0.987 -0.983 -0.98 -0.986 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-Y       : num  -0.932 -0.985 -0.971 -0.944 -0.966 ...
 $ frequencyBodyAccelerometerJerk-StdDev()-Z       : num  -0.961 -0.989 -0.984 -0.98 -0.986 ...
 $ frequencyBodyGyroscope-Mean()-X                 : num  -0.85 -0.986 -0.97 -0.967 -0.976 ...
 $ frequencyBodyGyroscope-Mean()-Y                 : num  -0.952 -0.983 -0.978 -0.972 -0.978 ...
 $ frequencyBodyGyroscope-Mean()-Z                 : num  -0.909 -0.963 -0.962 -0.961 -0.963 ...
 $ frequencyBodyGyroscope-StdDev()-X               : num  -0.882 -0.989 -0.976 -0.975 -0.981 ...
 $ frequencyBodyGyroscope-StdDev()-Y               : num  -0.951 -0.982 -0.977 -0.956 -0.977 ...
 $ frequencyBodyGyroscope-StdDev()-Z               : num  -0.917 -0.963 -0.967 -0.966 -0.963 ...
 $ frequencyBodyAccelerometerMagnitude-Mean()      : num  -0.862 -0.975 -0.966 -0.939 -0.962 ...
 $ frequencyBodyAccelerometerMagnitude-StdDev()    : num  -0.798 -0.975 -0.968 -0.937 -0.963 ...
 $ frequencyBodyAccelerometerJerkMagnitude-Mean()  : num  -0.933 -0.985 -0.976 -0.962 -0.977 ...
 $ frequencyBodyAccelerometerJerkMagnitude-StdDev(): num  -0.922 -0.985 -0.975 -0.958 -0.976 ...
 $ frequencyBodyGyroscopeMagnitude-Mean()          : num  -0.862 -0.972 -0.965 -0.962 -0.968 ...
 $ frequencyBodyGyroscopeMagnitude-StdDev()        : num  -0.824 -0.961 -0.955 -0.947 -0.959 ...
 $ frequencyBodyGyroscopeJerkMagnitude-Mean()      : num  -0.942 -0.99 -0.984 -0.984 -0.985 ...
 $ frequencyBodyGyroscopeJerkMagnitude-StdDev()    : num  -0.933 -0.989 -0.983 -0.983 -0.983 ...
```
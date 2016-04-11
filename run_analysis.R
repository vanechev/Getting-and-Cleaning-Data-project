# Vanessa Echeverria
# 10-Abril-2016
# Getting and Cleaning Data Project

# Download UCI HAR Dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "Dataset.zip", method = "curl")

unzip(zipfile = "Dataset.zip")

# 1. Merge the training and the test sets to create one data set.

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
activity_class = read.table("UCI HAR Dataset/activity_labels.txt", 
	header = FALSE)

# read train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
	header = FALSE)
x_train <- read.table("UCI HAR Dataset/train/x_train.txt", 
	header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
	header = FALSE)

#read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
	header = FALSE)
x_test <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

#merge partial data
subject <- rbind(subject_train, subject_test)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)

#set new column names
setnames(subject, "V1", "subject")
setnames(Y, "V1", "class")
setnames(features, names(features), c("f_num", "f_name"))
setnames(activity_class, names(activity_class), c("class", 
	"act_name"))
colnames(X) <- features[, 2]

#merge all data
data_subject_class <- cbind(subject, Y)
data <- cbind(data_subject_class, X)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
data <- data[, grepl("mean\\(\\)|std\\(\\)|subject|class", 
	colnames(data))]

# 3. Uses descriptive activity names to name the activities in the data set
data <- merge(data, activity_class, by = "class", all.x = TRUE)
#data$act_name <- as.character(data$act_name)

#drop class column
data <- subset(data, select = -c(class))

#order by subject
data <- arrange(data, subject)

# 4. Appropriately labels the data set with descriptive variable names.

names(data) <- gsub("std()", "StdDev", names(data))
names(data) <- gsub("mean()", "Mean", names(data))
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

new_data <- aggregate(subset(data, select = -c(act_name, subject)), 
	by = list(subject = data$subject, label = data$act_name), 
	mean)

# write the data
write.table(format(new_data, scientific = T), "tidy2.txt", 
	row.names = F, col.names = F, quote = 2)

## setting the working directory
setwd("/home/suresh/Suresh/R Coursera/assignments/data/UCI HAR Dataset")


## Reading features and activity labels

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("id", "Activity")

## preparing train dataset by using cbind

train_x_data <- read.table("train/X_train.txt")
train_y_data <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")
names(train_x_data) <- features[, 2]
names(train_y_data) <- "Activity"
names(train_sub) <- "Subject"
train_data <- cbind(train_sub, train_y_data, train_x_data)


## preparing test dataset by using cbind

test_x_data <- read.table("test/X_test.txt")
test_y_data <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")
names(test_x_data) <- features[, 2]
names(test_y_data) <- "Activity"
names(test_sub) <- "Subject"
test_data <- cbind(test_sub, test_y_data, test_x_data)


## preparing the final dataset by merging training and test data using rbind

data <- rbind(train_data, test_data)

## Extracting the measurements only on the mean and standard deviation for each measurement 

x <- data[, grep("mean", colnames(data))]
z <- x[, -grep("meanFreq", colnames(x))]
y <- data[, grep("std", colnames(data))]
tidydata1 <- cbind(data$Subject, data$Activity, z, y)
names(tidydata1)[1] <- "Subject"
names(tidydata1)[2] <- "Activity"


## Using the descriptive activity names to name the activities in the data set

index <- which(tidydata1$Activity %in% 1) 
tidydata1$Activity[index] <- "WALKING"

index <- which(tidydata1$Activity %in% 2) 
tidydata1$Activity[index] <- "WALKING_UPSTAIRS"

index <- which(tidydata1$Activity %in% 3) 
tidydata1$Activity[index] <- "WALKING_DOWNSTAIRS"

index <- which(tidydata1$Activity %in% 4) 
tidydata1$Activity[index] <- "SITTING"

index <- which(tidydata1$Activity %in% 5) 
tidydata1$Activity[index] <- "STANDING"

index <- which(tidydata1$Activity %in% 6) 
tidydata1$Activity[index] <- "LAYING"


## Labeling the data set with descriptive variable names

names(tidydata1) <- c("Subject", "Activity","time_body_acc_mean_Xaxis", "time_body_acc_mean_Yaxis", "time_body_acc_mean_Zaxis","time_gravity_acc_mean_Xaxis", "time_gravity_acc_mean_Yaxis", "time_gravity_acc_mean_Zaxis", "time_body_acc_jerk_mean_Xaxis", "time_body_acc_jerk_mean_Yaxis", "time_body_acc_jerk_mean_Zaxis", "time_body_gyro_mean_Xaxis", "time_body_gyro_mean_Yaxis", "time_body_gyro_mean_Zaxis", "time_body_gyro_jerk_mean_Xaxis", "time_body_gyro_jerk_mean_Yaxis", "time_body_gyro_jerk_mean_Zaxis", "time_body_acc_mag_mean", "time_gravity_acc_mag_mean", "time_body_acc_jerk_mag_mean", "time_body_gyro_mag_mean", "time_body_gyro_jerk_mag_mean", "freq_body_acc_mean_Xaxis", "freq_body_acc_mean_Yaxis", "freq_body_acc_mean_Zaxis", "freq_body_acc_jerk_mean_Xaxis", "freq_body_acc_jerk_mean_Yaxis", "freq_body_acc_jerk_mean_Zaxis", "freq_body_gyro_mean_Xaxis", "freq_body_gyro_mean_Yaxis", "freq_body_gyro_mean_Zaxis", "freq_body_acc_mag_mean", "freq_body_body_acc_jerk_mag_mean", "freq_body_body_gyro_mag_mean", "freq_body_body_gyro_jerk_mag_mean", "time_body_acc_std_Xaxis", "time_body_acc_std_Yaxis", "time_body_acc_std_Zaxis", "time_gravity_acc_std_Xaxis", "time_gravity_acc_std_Yaxis", "time_gravity_acc_std_Zaxis", "time_body_acc_jerk_std_Xaxis", "time_body_acc_jerk_std_Yaxis", "time_body_acc_jerk_std_Zaxis", "time_body_gyro_std_Xaxis", "time_body_gyro_std_Yaxis", "time_body_gyro_std_Zaxis", "time_body_gyro_jerk_std_Xaxis", "time_body_gyro_jerk_std_Yaxis", "time_body_gyro_jerk_std_Zaxis", "time_body_acc_mag_std", "time_gravity_acc_mag_std", "time_body_acc_jerk_mag_std", "time_body_gyro_mag_std", "time_body_gyro_jerk_mag_std", "freq_body_acc_std_Xaxis", "freq_body_acc_std_Yaxis", "freq_body_acc_std_Zaxis", "freq_body_acc_jerk_std_Xaxis", "freq_body_acc_jerk_std_Yaxis", "freq_body_acc_jerk_std_Zaxis", "freq_body_gyro_std_Xaxis", "freq_body_gyro_std_Yaxis", "freq_body_gyro_std_Zaxis", "freq_body_acc_mag_std", "freq_body_body_acc_jerk_mag_std", "freq_body_body_gyro_mag_std", "freq_body_body_gyro_jerk_mag_std" )


## Creating the second, independent tidy data set with the average(mean) of each variable for each activity and each subject

tidydata2 <- aggregate(tidydata1[,3:68],by=list(tidydata1$Subject, tidydata1$Activity),FUN=mean)
names(tidydata2)[1] <- "Subject"
names(tidydata2)[2] <- "Activity"


## exporting final dataset

write.table(tidydata2, "../tidydata.txt", sep="\t" )

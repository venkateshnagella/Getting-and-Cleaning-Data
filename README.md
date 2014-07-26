##Reading features and activity labels

Read features and activity labels into R environment.

##Preparing train dataset by using cbind

Read three train datasets into R environment. Lable the train dataset using features provided. Merge the three datasets to get the final train dataset using cbind function.

##Preparing test dataset by using cbind

Read three test datasets into R environment. Lable the test dataset using features provided. Merge the three datasets to get the final test dataset using cbind function.

##Preparing the final dataset

Merge train and test datasets using rbind function to create final dataset.

##Extracting the measurements only on the mean and standard deviation for each measurement

Filter the dataset to get subset of the dataset that contains columns with mean and starndard deviation. Create tidydataset using cbind.

##Using the descriptive activity names to name the activities in the data set

Find the index of each activity and rename it with descriptive name from activity lables that are loaded.

##Labeling the data set with descriptive variable names

Rename the columns with descriptive names.

##Creating the second, independent tidy data set with the average(mean) of each variable for each activity and each subject

Create the final tidy dataset by calculating the average by grouping activity and subject using aggregate function.

##Exporting final dataset

Export the final dataset into text file using write.table function.
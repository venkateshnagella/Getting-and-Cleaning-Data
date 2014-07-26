README FILE

This file contains analysis steps followed in “run_analysis.R” which analyses Samsung data (provided in Course Project – Getting Cleaning Data - Coursera - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and creates a new data set “tidyData” following the instructions required by the assigment. Information about variables, data and trasfomations are available “Codebook.md".

“run_analysis.R”

1) Merges the training and the test sets to create one data set. Read files in folder “test” and “train” and create two dataframes “train_data” and “test_data”. Create a complete dataset “data” merging “train_data” and “test_data”.

2) Extracts only the measurements on the mean and standard deviation for each measurement by using grep function and creating tidydata1 data set. 

3) Naming the activities in the dataset by using descriptive activitiy names. 


4) Appropriately labels the data set with descriptive variable names.


5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Using the function “aggregate” on “tidydata1” calculates the average of each variable grouping by activity and subject.


Creates a new file containing the tidy dataset (tidyData.txt)

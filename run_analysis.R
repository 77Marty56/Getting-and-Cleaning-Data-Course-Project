library(dplyr)

## 1)Merge train and test sets to create one data set
X_test <- read.table("./test/X_test.txt") ##features
Y_test <- read.table("./test/y_test.txt") ##action labels
subject_test <- read.table("./test/subject_test.txt") ##subject
test <- cbind(subject_test, Y_test, X_test)

X_train <- read.table("./train/X_train.txt") ##features
Y_train <- read.table("./train/y_train.txt") ##action labels
subject_train <- read.table("./train/subject_train.txt") ##subject
train <- cbind(subject_train, Y_train, X_train)

# combine train and test set
data <- rbind(train, test)

## 4)Appropriately label the dataset with descriptive variable names
features <- c("Subject", "Activity", read.table("features.txt")[, 2])
names(data) <- features

## 2)Extract only the measurements on the mean and std
data <- data %>% select("Subject", "Activity", contains("mean()"), contains("std()"))

## 3)Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("Code", "Activity")
data$Activity <- factor(data$Activity, labels = activity_labels[,2])

## 5)From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject
tidy_data <- data %>% group_by(Activity, Subject) %>% summarise_all(mean)
  
# create the tidy dataset
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
  
  
  
  
  
  
  
  

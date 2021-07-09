#load necessary packages
library(dplyr)

#load the data labels for the test set and change the name to labels
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", encoding = "UTF-16LE")
names(test_labels) <- "label"

#load the test set data
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")

#load the data labels for the training set and change the name to labels
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", encoding = "UTF-16LE")
names(train_labels) <- "label"

#load the training set data
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")

#load the training set data
features <- read.table("UCI HAR Dataset/features.txt")

#column bind the labels to the respective data sets
test_data <- cbind(test_labels,test_set)
train_data <- cbind(train_labels,train_set)

#unload unnecessary data
rm(test_labels)
rm(train_labels)
rm(test_set)
rm(train_set)

#row bind the training and test data sets
data <- rbind(test_data,train_data)

#change the names of the labels
names(data) <- c("label",features$V2)

#unload unnecessary data
rm(test_data)
rm(train_data)
rm(features)

#select only the ones that contain mean or standard deviation
extraction <- data %>% select(label,contains("mean()"),contains("std()"))

#unload unnecessary data
rm(data)

#create a temporary list "lst" and swap numeric values "labels" for the activity description
lst <- as.character(extraction$label)
lst[lst == "1"] <- "WALKING"
lst[lst == "2"] <- "WALKING_UPSTAIRS"
lst[lst == "3"] <- "WALKING_DOWNSTAIRS"
lst[lst == "4"] <- "SITTING"
lst[lst == "5"] <- "STANDING"
lst[lst == "6"] <- "LAYING"

#swap the labels for the activity description in our "extraction" data
extraction$label <- lst

#rename label column as activity
extraction <- extraction %>% rename(activity = label)

#remove temporary list
rm(lst)

#load the subject data for the test and training sets and change the name to subject
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", encoding = "UTF-16LE")
names(test_subject) <- "subject"
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", encoding = "UTF-16LE")
names(train_subject) <- "subject"

#row bind the subject data
subject <- rbind(test_subject, train_subject)

#remove unnecessary data
rm(test_subject)
rm(train_subject)

#new dataset with subject information
subject_activity <- cbind(subject,extraction)

#remove unnecessary data
rm(subject)

#group subject_activity data set by activity and subject and 
#then summarize the data by averaging mean and standard deviation columns
subject_activity %>% group_by(activity,subject) %>% summarize_all(mean)

#create tidy dataset
write.table(subject_activity, file ="tidy_dataset.txt", row.names = FALSE)

                                           
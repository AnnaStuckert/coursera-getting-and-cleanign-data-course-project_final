setwd("~/Documents/AU/4.Semester/Computational modelling :ExpMeth 4/Assignments/coursera-getting-and-cleanign-data-course-project/UCI HAR Dataset-kopi/")
#reading features and activity data
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#step 0
#reading train data
x_train <- read.table("train/X_train.txt") #features data

y_train <- read.table("train/y_train.txt") #activity labels

subject_train <- read.table("train/subject_train.txt") #subjects



#reading test data
x_test <- read.table("test/X_test.txt")

y_test <- read.table("test/y_test.txt") 

subject_test <- read.table("test/subject_test.txt")


#step 1: Merge the training and the test sets to create one data set.

#rename variables in x data
colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

# Rename variables in y data
colnames(y_train)[colnames(y_train) == "V1"] <- "activity"
colnames(y_test)[colnames(y_test) == "V1"] <- "activity"

# Rename variables in subject data
colnames(subject_train)[colnames(subject_train) == "V1"] <- "subject"
colnames(subject_test)[colnames(subject_test) == "V1"] <- "subject"

#bind all test data together, and all train data together
test  <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)

all_data <- rbind(test, train)


#step 2: get only measurements on the mean and standard deviation for each measurement 

#creating a vector with all the column names
col_names <- colnames(all_data)

# filtering out variables that are not standard deviation, mean values, activity and subject. values 
col_names_filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", col_names, value=TRUE)
all_data_filtered <- all_data[, col_names_filtered] 


#step 3: Using descriptive activity names to name the activities in the data set

#checking the names of the activities.
activityLabels <- read.table(file.path("activity_labels.txt"),header = FALSE)
head(activityLabels)

#adding new column with descriptive names of each activity, corresponding to the given factor in  the activity row.
all_data_filtered$activity <- factor(all_data_filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# step 4: Appropriately labeling the data set with descriptive variable names
names(all_data_filtered)<-gsub("^t", "time", names(all_data_filtered))
names(all_data_filtered)<-gsub("^f", "frequency", names(all_data_filtered))
names(all_data_filtered)<-gsub("Acc", "Accelerometer", names(all_data_filtered))
names(all_data_filtered)<-gsub("Gyro", "Gyroscope", names(all_data_filtered))
names(all_data_filtered)<-gsub("Mag", "Magnitude", names(all_data_filtered))
names(all_data_filtered)<-gsub("BodyBody", "Body", names(all_data_filtered))


#step 5: creating a second, independent tidy data set with the average of each variable for each activity and each subject.
all_data_filtered$activity <- as.factor(all_data_filtered$activity)
all_data_filtered$subject <- as.factor(all_data_filtered$subject)

library(reshape2)
all_data_filtered_melted <- reshape2::melt(all_data_filtered, id = c("subject", "activity"))
all_data_filtered_mean <- dcast(all_data_filtered_melted, subject + activity ~ variable, mean)

# creating a tidy dataset file 
write.table(all_data_filtered_mean, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)


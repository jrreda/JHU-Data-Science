## Reading datasets
# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


## 1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
y_total <- rbind(y_train, y_test)
sub_total <- rbind(sub_train, sub_test)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
measurements_cols <- variable_names[grep("(\\w+-mean[()])|(\\w+-std.*)", variable_names[, 2]), 2]
X_total <- X_total[,measurements_cols]


## 3. Uses descriptive activity names to name the activities in the data set.
colnames(y_total) <- "activity"
y_total$activity <- factor(y_total$activity, labels = as.character(activity_labels[,2]))


## 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- measurements_cols


## 5. From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.
  # each variable == y_total (activity)
  # each avtivity == X_total (step 4)
  # each subject == subject
library(dplyr)
colnames(sub_total) <- "subject"

total <- cbind(X_total, y_total, sub_total)
total_mean <- total %>% 
  group_by(activity, subject) %>%
  summarise_each(funs = mean)

write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt")

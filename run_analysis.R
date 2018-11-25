##
## Load only the required data fields -> where features contain mean/std 
##
features <- read.table("./UCI HAR Dataset/features.txt")
features_need <- features[grep("mean|std", features[,2]), ]
# grep returns the postions and the actual values are returned as the positions are encapsulated (nested) again in features



# select only the needed features in test and train data
# col 1 of features provides the col number holding the std/mean values, so we grab all rows of these cols
# This is requirement #2
#combine test and train data with labels
# each of the dfs have the same no. of cols. 3 dfs as the data has been normalised
# subject_train indicates which subject (1-32) the corresponding data_train is for 
# label_train indicates which of the 6 activity was done for the data_train
# data_train contains the recordings (data) of each activity labelled in label_train
# repeat the same operations twice - once for training, one for test
## 1. 
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
data_train_need <- data_train[, as.numeric(features_need[,1])]
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

train <- cbind(subject_train, label_train, data_train_need)

##2.
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_test_need <- data_test[, as.numeric(features_need[,1])]
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

test <- cbind(subject_test, label_test, data_test_need)

# merge the two datasets (test and train) into one
# appends one dataset after the other
# requirement #1
mergeddata <- rbind(train, test)



## Rename merged data with descriptive variable names
# This is requirement #4

# use  RE - removes the chars '('  , ')'  as it affects the operation in the subsequent line
features_need[,2]<- gsub("[()]","", features_need[,2]) 

# col 1 is from subject file, col 2 is from label file, the remaining cols are from the features file (see the cbind above)
colnames(mergeddata) <- c("subject", "activity", features_need[,2]) 



## Put a text description instead of a number to describe the activities in the data set
# - breaks normalisation rules (number takes less space than descriptive text)
# This is requirement #3  

# Load activity labels with descriptive text and put the descriptions into the mergeddata
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergeddata$activity <- factor(mergeddata$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])



## create average of each variable for each activity and each subject.
# This is requirement #5
# cols 1 & 2 do not need to be aggreated
summary_data <-aggregate(mergeddata[, 3:ncol(mergeddata)], by=list(mergeddata$subject,mergeddata$activity), FUN=mean, na.rm=TRUE)
# change 1st 2 colnames from Group1 & Group2 to something more meaningful
colnames(summary_data) [1:2]<- c("subject", "activity") 
write.table(summary_data, file="submit_tidy_data.txt", row.names = FALSE)
#run_analysis.R
#R script for Getting and Cleaning Data Course Project

#The steps 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Loading dplyr and tidyr library for later use ...
library("dplyr")
library("tidyr")

#Download the files and unzip them 
if(!file.exists("data")) {
        dir.create("data")
}
if(!file.exists("./data/Dataset.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        if(!file.exists("./data/Dataset.zip")) {
                download.file(fileUrl, destfile="./data/Dataset.zip")
        }
        unzip("./data/Dataset.zip",exdir="./data")
}


#Read the Features names 
Features_names<-read.table("./data/UCI HAR Dataset/features.txt")

#Read the Train Data 
Subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

#Read the Test Data 
Subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

#rename V1 columns before the merge (Subject id abd y_train)
colnames(Subject_test)[1] <- 'Subject_ID'
colnames(Subject_train)[1] <- 'Subject_ID'

colnames(y_train)[1] <- 'Activity_type'
colnames(y_test)[1] <- 'Activity_type'

###############################################################################################
#Step #1 merge the Training and the test sets into one dataset
###############################################################################################
#combine the subjects train set with the X_train and y_train using  cbind (columns bind) 
data_train_with_sbjects_id<-cbind(Subject_train,y_train,X_train)

#combine the subjects test set with the X_test and y_test using  cbind (columns bind) 
data_test_with_sbjects_id<-cbind(Subject_test,y_test,X_test)

#combine the two data sets (Train and test)into one data set using rbind (rows)
combined_data_set<-rbind(data_train_with_sbjects_id,data_test_with_sbjects_id)

##############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#select the features which contains mean or std 
#My intepetation here is to select all features which contain the word mean and std in their
#names 
##############################################################################################

#converting to a temporary lower case vector in order to select all the mean and std features 
Fetures_names_lower_case<-tolower(Features_names[, 2])
features_col_names<-grep("mean|std",Fetures_names_lower_case)

#add offset of 2 in order to take into acount the subject id and activity type 
features_col_names_offset<-features_col_names+2
#using select (from dplyr library) select all mean and std colomns, subject id and activity id
data_set_with_mean_std<-select(combined_data_set,c(1,2,features_col_names_offset))

##############################################################################################
# Step 3 Uses descriptive activity names to name the activities in the data set
#read the activity labels to use it as mapping
##############################################################################################
activities_table<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
#Create mapping for the activities and replace the index by the activities names 
Activity_map = setNames(activities_table[,1],activities_table[,2])
data_set_with_mean_std$Activity_type<-names(Activity_map[unlist(data_set_with_mean_std$Activity_type)])

##############################################################################################
# Step 4. Appropriately labels the data set with descriptive variable names.
#this step already started by changing the Subject ID and Activity type colomns 
# now use the features name to replace the V1,V2 .... colmns names 
##############################################################################################
#create a vector of the feature names (only the ones with mean and std)
Features_Names_mean_std_vector<-Features_names[features_col_names,2]

#Some text cleaning 
Features_Names_mean_std_vector<-as.character(Features_Names_mean_std_vector)
#Remove ( , ) and -
Features_Names_mean_std_vector<-gsub("\\(|\\)|-"," ",Features_Names_mean_std_vector)

#Replace ACC by Acceleerometer
Features_Names_mean_std_vector <- gsub("Acc", " Accelerometer ", Features_Names_mean_std_vector)
#Replace Gyro by  Gyroscope
Features_Names_mean_std_vector <- gsub("Gyro", " Gyroscope ", Features_Names_mean_std_vector)
#Replace Mag by Magnitude 
Features_Names_mean_std_vector <- gsub("Mag", " Magnitude ", Features_Names_mean_std_vector)
#Repalce starting f or Freq by Frequancy 
Features_Names_mean_std_vector <- gsub("Freq", " Frequency ", Features_Names_mean_std_vector)
Features_Names_mean_std_vector <- gsub("^f", "Frequency ", Features_Names_mean_std_vector)
#Correct mean to Mean 
Features_Names_mean_std_vector <- gsub("mean", "Mean", Features_Names_mean_std_vector)
#Correct std  to Standard_Deviation
Features_Names_mean_std_vector <- gsub("std", "Standard_Deviation", Features_Names_mean_std_vector)
#Replace starting t by Time 
Features_Names_mean_std_vector <- gsub("^t", "Time ", Features_Names_mean_std_vector)
#remove duplicate body body 
Features_Names_mean_std_vector <- gsub("BodyBody", " Body ", Features_Names_mean_std_vector)

#Rename the columns of the features (all columns except the first two which are the subjects and the activity )
colnames(data_set_with_mean_std)[3:ncol(data_set_with_mean_std)] <- Features_Names_mean_std_vector


###############################################################################################
# Step 5.From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.
###############################################################################################
TidyData_mean_activity <- data_set_with_mean_std %>%
        group_by(Subject_ID,Activity_type) %>%
        summarise_all(funs(mean))


# output to file "tidy_data_mean.txt"
write.table(TidyData_mean_activity, "TidyData_mean_activity.txt", row.names = FALSE, 
            quote = FALSE)


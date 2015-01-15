#read in the data
#train data
     data_train_x <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE) 
     data_train_y <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE) 
     data_train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE) 
#test data
     data_test_x <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE) 
     data_test_y <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE) 
     data_test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE) 

#1. Merges the training and the test sets to create one data set.
     data_train <- cbind(data_train_subject, data_train_y, data_train_x)
     data_test <- cbind(data_test_subject, data_test_y, data_test_x)
#in the order subject, activity, set
     data_combined<- rbind(data_train, data_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#read in features
     features <- read.table("./UCI HAR Dataset/features.txt")
#logical vetor for the rows with mean() and standard deviation std()
     Rows <-grepl("mean\\(\\)|std\\(\\)", features[,2])
#subset the data(the first two rows are subject and activity)
     data_sub<- subset(data_combined, select = c(TRUE,TRUE,Rows))
     
#3. Uses descriptive activity names to name the activities in the data set
#read in ac labels
     aclabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
#replace the labels in subset data with names
     data_sub[,2] = aclabel[data_sub[,2],2] 
     
#4. Appropriately labels the data set with descriptive variable names. 
#assign the names
     names(data_sub)=c("subject", "activity", as.character(features[,2][Rows]))
     names(data_sub) = gsub("^(t)","Time-",names(data_sub))
     names(data_sub) = gsub("^(f)","Freq-",names(data_sub))
     names(data_sub) = gsub("-std","Std",names(data_sub))
     names(data_sub) = gsub("-mean","Mean",names(data_sub))

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
     data_ind<-aggregate(. ~subject + activity, data_sub, mean)  
     write.table(data_ind, "tidy-dataset.txt", row.names=FALSE)
### Getting and Cleaning Data
## Course Project

## CdG
# 16th March 2015

#######
#loading the data
#######
#the unzipped folder is in the directory this analysis is run from

#test data
xTest = read.table("UCI HAR Dataset/test/X_test.txt")
yTest = read.table("UCI HAR Dataset/test/Y_test.txt")
subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt")

#training data
xTrain = read.table("UCI HAR Dataset/train/X_train.txt")
yTrain = read.table("UCI HAR Dataset/train/Y_train.txt")
subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt")

#labels
features = read.table("UCI HAR Dataset/features.txt",stringsAsFactors=F)
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)

#check data has the appropriate rows
dim(xTest)
dim(xTrain)

dim(yTest)
dim(yTrain)


######
# Merges the training and the test sets to create one data set.
#####
xMerge = rbind(xTest,xTrain)
yMerge = rbind(yTest,yTrain)
subjectMerge = rbind(subjectTest,subjectTrain)

dataMerge = cbind(subjectMerge,yMerge,xMerge)


### 
#Appropriately labels the data set with descriptive variable names. 
# Set colnames to feature names
###

colnames(dataMerge)[3:ncol(dataMerge)] = features[,2]
colnames(dataMerge)[2] = "Activity"
colnames(dataMerge)[1] = "Subject"


######
#Extracts only the measurements on the mean and standard deviation for each measurement. 
######

#columns with a mean
grep("mean",features[,2])
#this skips the columns at the end that are angle(X,gravityMean) etc, as these are angles, not means

#columns with an sd
grep("std",features[,2])

#also include the activity and subject column
dataTrim = dataMerge[,c(1,2,(grep("mean",features[,2])+2),(grep("std",features[,2])+2))]
dim(dataTrim)

#Uses descriptive activity names to name the activities in the data set

table(dataTrim$Activity)
dataTrim$Activity = activityLabels[dataTrim$Activity,2]
table(dataTrim$Activity)

####
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####


library(dplyr)
gravData = tbl_df(dataTrim)

#need to replace - in column names with underscores
colnames(gravData) = gsub("-","_",colnames(gravData))
colnames(gravData) = gsub("\\(\\)","",colnames(gravData))


grpData <- group_by(gravData, Activity,Subject)
sumData = summarise_each(grpData,funs(mean))
          

#get rid of extra sig figs
options(digits=2)

sumData


write.table(file="GravDataSum.txt",sumData,quote=F,row.name=FALSE) 


# 03_getcleandata


This is the code for the Getting and Cleaning Data Course Project

The goal of this assignment is to tidy the some data from the accelerometers from the Samsung Galaxy S smartphone. 

The data was obtained from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This also provides a description of the data

In short:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The version of the data used for this analysis was downloaded from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The file run_anlaysis.R contains the anlaysis. the code works as follows:

The data is loaded from the unzipped folder which is in the directory this script is run from.
It comes as 8 files:
#test data
 X_test.txt
 Y_test.txt
 subject_test.txt

#training data
 X_train.txt
 Y_train.txt
 subject_train.txt

#labels
  features.txt
  activity_labels.txt

The data initially comes as a training and a test set, which are split into measurements (y), activity (x) and subject (subject)
I first merge the test and training together for each type of data
Then the subject, activity and measurements together. 

Column names are replaced with a meaningful text name

The data is simplified by extracting only the means and standard deviations for each measurement. 

The data descirbes six acivities that are coded with numbers. These are replaced with the full name of the activity. 

The data is then summarised with dplyr into the average of each variable for each activity and subject. 
The group_by function groups the data by acitivity and subject
We then wish to get the mean of many columns, so we use summarise_each()

The data is then written to file


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


The file run_anlaysis.R contains the anlaysis. A summary is as follows

 The data initially comes as a training and a test set. 
 These are merged into one data set.
 
 The data is simplified by extracting only the means and standard deviations for each measurement. 
 
The data descirbes six acivities that are coded with numbers. These are replaced with the full name of the activity. 

The data is then summarised with dplyr into the average of each variable for each activity and subject. 


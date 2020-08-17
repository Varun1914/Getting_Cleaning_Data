# Course Project
# Author: Paul Vinod
# Course: Getting and Cleaning Data

# Download files
filename = "CourseProject.zip"
if(!file.exists(filename))
{
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,
                  destfile = filename,
                  method = "curl")

}

#Extracting the information
if(!file.exists("UCI HAR Dataset"))
{
    unzip(filename)
}


# Gather information of each data values.
# Features information
feature_val <- read.table("UCI HAR Dataset/features.txt",col.names = c("n","functions"))
activity_lab <- read.table("UCI HAR Dataset/activity_labels.txt",
                            col.names = c("code","activity"))
subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject")
x_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt",
                      col.names = feature_val$functions)
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt",
                      col.names = "code")

subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt",
                            col.names = "subject")
x_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt",
                      col.names = feature_val$functions)
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt",
                      col.names = "code")


source("./run_analysis.R")

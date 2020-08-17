# Name: run_analysis.R
# Author: Paul Vinod
# Course: Getting and Cleaning Data

# Library loading.
library(dplyr)

# Merging the test and run data Problem 1
d_set       <- rbind(x_train, x_test)
d_label     <- rbind(y_train, y_test)
d_subject   <- rbind(subject_train,subject_test)
d_collab1   <- cbind(d_subject, d_label, d_set)

# Mean and Standard deviation
tidy_data <- d_collab1 %>% select(subject, code,
                                  contains("mean")|contains("std"))

# Uses descriptive activity names to name the activities in the data set
tidy_data <- tidy_data %>% mutate(code = activity_lab[code,2])

# Appropriately labels the data set with descriptive variable names.
names(tidy_data) <- gsub("^t","Time", names(tidy_data))
names(tidy_data) <- gsub("^f","Frequency", names(tidy_data))
names(tidy_data) <- gsub("^angle","Angle", names(tidy_data))
names(tidy_data) <- gsub("Acc","Acceleration", names(tidy_data))
names(tidy_data) <- gsub("Gyro","Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("tBody","TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-std()","STD", names(tidy_data))
names(tidy_data) <- gsub("-mean()","Mean", names(tidy_data))

# From the data set in step 4, creates a second, independent tidy
# data set with the average of each variable for each activity and each subject

tidy_new_data <- tidy_data %>% group_by(subject, code) %>%
                  summarise_all(.funs = mean)

write.table(x = tidy_new_data,
            file = "Output_tidy_data.txt",
            row.names = FALSE)

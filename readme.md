### Running the script
* Clone this repository
* Download the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and extract it in the same directory
as run_analysis.R
* Do NOT change any pathing or names inside of the extracted data set, file structure should be:
     + run_analysis.R
     + /UCI HAR Dataset
* From RStudio 
     + setwd("{cloned repository directory}")
     + source("run_analysis.R")
* tidydata.txt will be created in the cloned repository directory

### How it works
1. Reads in the features data set
2. Reads in the test data sets and cbinds them together 
3. Reads in the training data sets and cbinds them together
4. Rbinds the training and test data sets
5. Finds all columns that contain either a mean or standard deviation measurement
6. Removes all other feature columns from the data set
7. Transforms the activity field from ID to descriptive name 
8. Melts the data set using Subject and Activity fields to create the id
9. Re-casts the melted data, finding the mean for each variable in the data set
10. Changes column names where apporpriate
11. Writes out tidydata.txt
12. Informs the user of the creation of the file
13. Informs the user of how to read the table, using R

### Reading the tidy data
* From RStudio
     + read.table("tidydata.txt", sep="\t", header=T)

### Code Book
* [Available here](https://github.com/justindlea/getcleandataproject/blob/master/CodeBook.md)
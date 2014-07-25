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

### Reading the tidy data
* From RStudio
     + read.table("tidydata.txt", sep="\t", header=T)

### Code Book
* [Available here](https://github.com/justindlea/getcleandataproject/blob/master/CodeBook.md)
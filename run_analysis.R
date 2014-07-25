## function used to transform Activity id's into descriptive names
transformactivity<-function(data) {
     data$Activity[data$Activity==1]<-"WALKING"
     data$Activity[data$Activity==2]<-"WALKING UPSTAIRS"
     data$Activity[data$Activity==3]<-"WALKING DOWNSTAIRS"
     data$Activity[data$Activity==4]<-"SITTING"
     data$Activity[data$Activity==5]<-"STANDING"
     data$Activity[data$Activity==6]<-"LAYING"
     
     data
}

## read in features which will be used for the colnames of x data.frame
features<-read.delim("UCI HAR Dataset\\features.txt",sep=" ",header=F)

## read in test datasets
subject_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt", col.names=c("Subject"))
y_test<-read.table("UCI HAR Dataset\\test\\y_test.txt", col.names=c("Activity"))
x_test<-read.table("UCI HAR Dataset\\test\\x_test.txt", col.names=features$V2, check.names=F)

## combine into test data.frame
testdata<-cbind(subject_test,y_test,x_test)

## remove ununsed data.frames()
rm(subject_test,y_test,x_test)

## read in training datasets
subject_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt",col.names=c("Subject"))
y_train<-read.table("UCI HAR Dataset\\train\\y_train.txt", col.names=c("Activity"))
x_train<-read.table("UCI HAR Dataset\\train\\x_train.txt", col.names=features$V2, check.names=F)

## combine into training data.frame
trainingdata<-cbind(subject_train,y_train,x_train)

## remove unused data.frames
rm(subject_train,x_train,y_train,features)

## combine test and training datasets
joined<-rbind(testdata,trainingdata)

#remove unused data.frames
rm(testdata, trainingdata)

## retain all columns that contain either a mean or a standard deviation
meanindex<-grep("mean()", colnames(joined), fixed=T)
stdindex<-grep("std()", colnames(joined), fixed=T)

## combine mean and std columns into a vector
columns<-c(meanindex,stdindex)
columns<-sort(columns)

## retain columns which will be included in the new dataset
joined<-joined[c(1,2,columns)]

## remove unused vectors
rm(columns,meanindex,stdindex)

## translate Activity Id's into descriptive names
joined<-transformactivity(joined)

library(reshape2)
## melt the data
melted<-melt(joined, id=c("Subject","Activity"))
## create tidy to be written data.frame
tidy<-dcast(melted, formula=Subject+Activity ~ variable, mean)

rm(melted)

## transform column names
col_names <- colnames(tidy)

col_names <- gsub("-mean()","Mean",col_names,fixed=T)
col_names <- gsub("-std()","Std",col_names,fixed=T)
col_names <- gsub("Acc", "Accel",col_names,fixed=T)
col_names <- gsub("BodyBody","Body",col_names,fixed=T)

## apply new, tidy column names to tidy data
colnames(tidy) <- col_names

## remove unused data.frame and vector
rm(joined,col_names)

write.table(tidy, "tidydata.txt", sep="\t", row.names=F)

## remove remaining data from Global Environment
rm(tidy,transformactivity)
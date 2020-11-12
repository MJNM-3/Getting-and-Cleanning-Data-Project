## Consider that you need to unzip the provided messy data on the carpet setted as your working directory
## We have two sets of data: 1- Train 2- Test
## Let's properly name all data files including the list of features
X_train <- read.table("wd/Data/train/X_train.txt")
y_train <- read.table("wd/Data/train/y_train.txt")
subject_train <- read.table("wd/Data/train/subject_train.txt")
X_test <- read.table("wd/Data/test/X_test.txt")
y_test <- read.table("wd/Data/test/y_test.txt")
subject_test <- read.table("wd/Data/test/subject_test.txt")
features <- read.table("wd/Data/features.txt")
## Merge the sets
mergedSets <- rbind(X_train, X_test) 
mergedSets$labels <- rbind(y_train, y_test) 
mergedSets$subjects <- rbind(subject_train, subject_test) 
## Name the columns
colnames(mergedSets) <- features$V2 
## Create data frame to read the the class labels with their activity name
df2 <- mergedSets[,grepl("mean()|std()", names(mergedSets))]
df2 <- cbind(subjects = rbind(subject_train, subject_test), labels = rbind(y_train, y_test), df2)
colnames(df2)[1]<-"subject"
colnames(df2)[2]<-"activity"
activity_names <- read.table("wd/Data/activity_labels.txt")
## Write the tidy data into txt format
Tidy_Data <- write.table(df2,"wd/Tidy_Data.txt", row.name=FALSE)

library(plyr)

# read X
test <- read.table('test/X_test.txt', header=F, colClasses = 'numeric')
train <- read.table('train/X_train.txt', header=F, colClasses = 'numeric')
# Merges the training and the test sets to create one data set.
x <- rbind(test, train)
# Appropriately labels the data set with descriptive variable names. 
f <- read.table('features.txt', header=F, colClasses = 'character')
colnames(x) <- f$V2

# read Y
test <- read.table('test/y_test.txt', header=F, colClasses = 'character')
train <- read.table('train/y_train.txt', header=F, colClasses = 'character')
# Merges the training and the test sets to create one data set.
y <- rbind(test, train)
# Appropriately labels the data set with descriptive variable names. 
colnames(y) <- 'Activity'

# read Subject
test <- read.table('test/subject_test.txt', header=F)
train <- read.table('train/subject_train.txt', header=F)
# Merges the training and the test sets to create one data set.
s <- rbind(test, train)
# Appropriately labels the data set with descriptive variable names. 
colnames(s) <- 'Subject'

# Extracts only the measurements on the mean and standard deviation for each measurement.
condi<- grepl( 'mean\\(\\)|std\\(\\)', colnames(x))
data <- x[, condi]

# Uses descriptive activity names to name the activities in the data set
lbls <- read.table('activity_labels.txt', header=F)
act <- function(i) lbls[i, ]$V2
y <- mutate(y, Activity = act(Activity))

# bind subject, Y, and X
data <- cbind (s, y , data)

write.table(data, 'tidy-1.txt')


# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

summary <- aggregate(data[,c(-1,-2)], by = list(activity = data$Activity, subject = data$Subject), mean)
write.table(summary, 'tidy-2-mean_std_only.txt')

summary2 <- aggregate(x, by = list(activity = data$Activity, subject = data$Subject), mean)
write.table(summary2, 'tidy-2-all.txt')


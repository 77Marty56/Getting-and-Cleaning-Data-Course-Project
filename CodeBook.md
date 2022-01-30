# CodeBook for final project -Getting and Cleaning Data-
## Description of the data
The dataset that was used for this project can be found at this link: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The original dataset contains data about human activity recognition using smartphones. The experiment has been carried out with a group of 30 people (1-30). Each person performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. The weareable smartphone had embedded two sensors: a gyroscope and an accelerometer. These sensors collected some measurements at certain times while the 30 people where doing one of the 6 activities. The measurments have been recorded in 561 variables. The rows in our dataset are 10299 and each instance is about one person doing a specific activity. For each row, there's also a corresponding label containing the name of the activity the person was performing during the measurements. 

## Description of the variables
The features selected for this database come from the accelerometer and gyroscope. They are the following:
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag.  
Then for each variable we collected:  
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation  
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure  
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window  
angle(): Angle between vectors.  
Additionally:  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean.
On top of these variables, each instance contains a label indicating which activity was performed (1-6) and the code of the person performing the activity (1-30).


## Description of the trasformation/work performed on the data
In the code contained in the R file run_analysis.R the following was performed on the data:    
1)The data sets containing the features (X) were combined with the data sets containing the labels (y) and the activities for both the train and test set. At this point we have 561 + 2 = 563 variables.  
2)The train and test sets were combined into one set.   
3)The dataset does not contain at this point the variable names. So the names were added using the file containing the list of the features names.   
4)Out of all the variables we extract only the variables containing the word -mean- and -sd-.  
5)The activity variable contains numbers from 1 to 6 representing the six activities. We replace the numbers with the actual names.   
6)Out of this data set we create a new dataset -tidy dataset- were we group the rows by the activity and then by subject (1-30). The for each group we compute the mean of all the variables (those containing the word mean and sd).  
7)The tidy dataset get written on the working directory as a .txt file.  


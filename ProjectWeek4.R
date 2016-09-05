#Project Week 4:
##Introduction:
###The objective of this project is to analize the data to determine how well 6 participants perform by using accelerometers on the belt, forearm and arm   

##Install packages:

library(AppliedPredictiveModeling)
library(caret)
library(rattle)
library(rpart.plot)
library(randomForest)
library(lattice)
library(ggplot2)
library(MASS)
library(klaR)

##Download Data for Training and Testing:

valtrain<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"

valtest<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

##Position Working Directory:

getwd()

##Create Files:

dst2 = 'C:/Users/Chispita/Documents/Data Science/Machine Learning/Project/training.csv'
download.file(valtrain, dst2, mode = 'wb')
training<- read.csv("training.csv",na.strings=c("NA","#DIV/0!",""))

dst3 = 'C:/Users/Chispita/Documents/Data Science/Machine Learning/Project/testing.csv'
download.file(valtest, dst3, mode = 'wb')
testing<- read.csv("testing.csv",na.strings=c("NA","#DIV/0!",""))

##Print the Dimension of the datasets

dim(training)
dim(testing)

##Clean the Datasets from useless variables to prevent overfitting the models:
  
varTrain<-subset(training,select=c(roll_belt,	pitch_belt,	yaw_belt,	total_accel_belt,	gyros_belt_x,	gyros_belt_y,	gyros_belt_z,	accel_belt_x,	accel_belt_y,	accel_belt_z,	magnet_belt_x,	magnet_belt_y,	magnet_belt_z,	roll_arm,	pitch_arm,	yaw_arm,	total_accel_arm,	gyros_arm_x,	gyros_arm_y,	gyros_arm_z,	accel_arm_x,	accel_arm_y,	accel_arm_z,	magnet_arm_x,	magnet_arm_y,	magnet_arm_z,	roll_dumbbell,	pitch_dumbbell,	yaw_dumbbell,	total_accel_dumbbell,	gyros_dumbbell_x,	gyros_dumbbell_y,	gyros_dumbbell_z,	accel_dumbbell_x,	accel_dumbbell_y,	accel_dumbbell_z,	magnet_dumbbell_x,	magnet_dumbbell_y,	magnet_dumbbell_z,	roll_forearm,	pitch_forearm,	yaw_forearm,	total_accel_forearm,	gyros_forearm_x,	gyros_forearm_y,	gyros_forearm_z,	accel_forearm_x,	accel_forearm_y,	accel_forearm_z,	magnet_forearm_x,	magnet_forearm_y,	magnet_forearm_z,classe))

varTest<-subset(testing,select=c(roll_belt,	pitch_belt,	yaw_belt,	total_accel_belt,	gyros_belt_x,	gyros_belt_y,	gyros_belt_z,	accel_belt_x,	accel_belt_y,	accel_belt_z,	magnet_belt_x,	magnet_belt_y,	magnet_belt_z,	roll_arm,	pitch_arm,	yaw_arm,	total_accel_arm,	gyros_arm_x,	gyros_arm_y,	gyros_arm_z,	accel_arm_x,	accel_arm_y,	accel_arm_z,	magnet_arm_x,	magnet_arm_y,	magnet_arm_z,	roll_dumbbell,	pitch_dumbbell,	yaw_dumbbell,	total_accel_dumbbell,	gyros_dumbbell_x,	gyros_dumbbell_y,	gyros_dumbbell_z,	accel_dumbbell_x,	accel_dumbbell_y,	accel_dumbbell_z,	magnet_dumbbell_x,	magnet_dumbbell_y,	magnet_dumbbell_z,	roll_forearm,	pitch_forearm,	yaw_forearm,	total_accel_forearm,	gyros_forearm_x,	gyros_forearm_y,	gyros_forearm_z,	accel_forearm_x,	accel_forearm_y,	accel_forearm_z,	magnet_forearm_x,	magnet_forearm_y,	magnet_forearm_z,problem_id))

##RE-Print the Dimension of the new datasets:

dim(varTrain)
dim(varTest)

##Search for Near Zero Variance that can affect the models:
nsv <- nearZeroVar(varTrain, saveMetrics=TRUE)
nsv

###No NSV's at this point

##Build the Models:

###Firs of all, we want create a partition to separate the Training/Testing data from the Training dataset (varTrain). Once this is performed, we would like to analize the data by using, at least, two different models. The analysis will allow us to determine which one of the models is more accurate. Ones the best model is selected, we can use that model to reference back to the Testing dataset (varTest), so we can predict the outcome of "Classe" 

set.seed(300)

subsamples <- createDataPartition(y=varTrain$classe, p=0.75, list=FALSE)
subTraining <- varTrain[subsamples, ] 
subTesting <- varTrain[-subsamples, ]

##Print the Dimension of the sub-datasets:

dim(subTraining)
dim(subTesting)

##Build the first model.

###We'll use "train" from the "Caret" package to sets up a grid of tuning parameters for a number of classification and regression routines. The prefered method for this trial will be Recursive Partitioning and Regression Trees (rpart) 

modelFit1 <- train(classe ~ .,method="rpart",data=subTraining)

###Calculate a cross-tabulation of observed and predicted classes with associated statistics. At this point, I'm interested in calculate how accurate this model is 
confusionMatrix(subTesting$classe,predict(modelFit1,subTesting))$overall[1]

###I like to print the outcome by usinf the object "finalModel" to refit with the whole dataset after the different lavels of "Classe" were optimized using resampling technique. The results show these levels' weights in relation to the variables 
print(modelFit1$finalModel)

###Now we can plot this information to make it more graphical:
fancyRpartPlot(modelFit1$finalModel)

##Build the second model:

modelFit2 <- randomForest(classe ~. , data=subTraining, method="rf")

confusionMatrix(subTesting$classe,predict(modelFit2,subTesting))$overall[1]

###The "randomeForest" model it's more accurate than "train". Thus, we'll use the second model to reference back the testing dataset (varTest)
print(modelFit2$finalModel)

###random forest can't be run with finalModel because is the best prediction itself, so result = NULL

##Final prediction

###Make the final prediction by inserting the random forest model into the predict fucntion:
finalPrediction<-predict(modelFit2,varTest)
finalPredion

###This shows what's the preducted "classe" on each one of the trials of the testing dataset.

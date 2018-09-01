# Code Book for the Project Course  -  Getting-and-Cleaning-Data
This is the codebook for the TidyData_mean_activity.txt file

## Introduction 
The repository contains the following files 
README.MD - readme file of the project 
CodeBook.MD - This Code book 
run_analysis.R - R script file which created the TidyData_mean_activity.txt file
The purpose of this project is to use the five steps to create a tidy text file with mean values of the variables described below. The mean observations are per subject and his activities 

## Data - Identiferyes 
There are two variables which are the identifiers 

Subject_ID (interger)
 interger between 1-30 , which identify the 30 subjects that were part of the test 

Activity_type (chercahter)
Activity type , orginaly an interger which identify the activity type :

1 - WALKING
2 - WALKING_UPSTAIRS
3 - WALKING_DOWNSTAIRS
4 - SITTING
5 - STANDING
6 - LAYING

## Data - Measurments 
The data measurements of the raw files were selected based on the criteria :
Observations which contains mean 
Observations which contains std 
The observations are the mean per subject per activity : 
The observations which were selected (as they were renamed in the final dataset ) :
1.	TimeBodyAccelerometerMeanX
2.	TimeBodyAccelerometerMeanY
3.	TimeBodyAccelerometerMeanZ
4.	TimeBodyAccelerometerStandard_DeviationX
5.	TimeBodyAccelerometerStandard_DeviationY
6.	TimeBodyAccelerometerStandard_DeviationZ
7.	TimeGravityAccelerometerMeanX
8.	TimeGravityAccelerometerMeanY
9.	TimeGravityAccelerometerMeanZ
10.	TimeGravityAccelerometerStandard_DeviationX
11.	TimeGravityAccelerometerStandard_DeviationY
12.	TimeGravityAccelerometerStandard_DeviationZ
13.	TimeBodyAccelerometerJerkMeanX
14.	TimeBodyAccelerometerJerkMeanY
15.	TimeBodyAccelerometerJerkMeanZ
16.	TimeBodyAccelerometerJerkStandard_DeviationX
17.	TimeBodyAccelerometerJerkStandard_DeviationY
18.	TimeBodyAccelerometerJerkStandard_DeviationZ
19.	TimeBodyGyroscopeMeanX
20.	TimeBodyGyroscopeMeanY
21.	TimeBodyGyroscopeMeanZ
22.	TimeBodyGyroscopeStandard_DeviationX
23.	TimeBodyGyroscopeStandard_DeviationY
24.	TimeBodyGyroscopeStandard_DeviationZ
25.	TimeBodyGyroscopeJerkMeanX
26.	TimeBodyGyroscopeJerkMeanY
27.	TimeBodyGyroscopeJerkMeanZ
28.	TimeBodyGyroscopeJerkStandard_DeviationX
29.	TimeBodyGyroscopeJerkStandard_DeviationY
30.	TimeBodyGyroscopeJerkStandard_DeviationZ
31.	TimeBodyAccelerometerMagnitudeMean
32.	TimeBodyAccelerometerMagnitudeStandard_Deviation
33.	TimeGravityAccelerometerMagnitudeMean
34.	TimeGravityAccelerometerMagnitudeStandard_Deviation
35.	TimeBodyAccelerometerJerkMagnitudeMean
36.	TimeBodyAccelerometerJerkMagnitudeStandard_Deviation
37.	TimeBodyGyroscopeMagnitudeMean
38.	TimeBodyGyroscopeMagnitudeStandard_Deviation
39.	TimeBodyGyroscopeJerkMagnitudeMean
40.	TimeBodyGyroscopeJerkMagnitudeStandard_Deviation
41.	FrequencyBodyAccelerometerMeanX
42.	FrequencyBodyAccelerometerMeanY
43.	FrequencyBodyAccelerometerMeanZ
44.	FrequencyBodyAccelerometerStandard_DeviationX
45.	FrequencyBodyAccelerometerStandard_DeviationY
46.	FrequencyBodyAccelerometerStandard_DeviationZ
47.	FrequencyBodyAccelerometerMeanFrequencyX
48.	FrequencyBodyAccelerometerMeanFrequencyY
49.	FrequencyBodyAccelerometerMeanFrequencyZ
50.	FrequencyBodyAccelerometerJerkMeanX
51.	FrequencyBodyAccelerometerJerkMeanY
52.	FrequencyBodyAccelerometerJerkMeanZ
53.	FrequencyBodyAccelerometerJerkStandard_DeviationX
54.	FrequencyBodyAccelerometerJerkStandard_DeviationY
55.	FrequencyBodyAccelerometerJerkStandard_DeviationZ
56.	FrequencyBodyAccelerometerJerkMeanFrequencyX
57.	FrequencyBodyAccelerometerJerkMeanFrequencyY
58.	FrequencyBodyAccelerometerJerkMeanFrequencyZ
59.	FrequencyBodyGyroscopeMeanX
60.	FrequencyBodyGyroscopeMeanY
61.	FrequencyBodyGyroscopeMeanZ
62.	FrequencyBodyGyroscopeStandard_DeviationX
63.	FrequencyBodyGyroscopeStandard_DeviationY
64.	FrequencyBodyGyroscopeStandard_DeviationZ
65.	FrequencyBodyGyroscopeMeanFrequencyX
66.	FrequencyBodyGyroscopeMeanFrequencyY
67.	FrequencyBodyGyroscopeMeanFrequencyZ
68.	FrequencyBodyAccelerometerMagnitudeMean
69.	FrequencyBodyAccelerometerMagnitudeStandard_Deviation
70.	FrequencyBodyAccelerometerMagnitudeMeanFrequency
71.	FrequencyBodyAccelerometerJerkMagnitudeMean
72.	FrequencyBodyAccelerometerJerkMagnitudeStandard_Deviation
73.	FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency
74.	FrequencyBodyGyroscopeMagnitudeMean
75.	FrequencyBodyGyroscopeMagnitudeStandard_Deviation
76.	FrequencyBodyGyroscopeMagnitudeMeanFrequency
77.	FrequencyBodyGyroscopeJerkMagnitudeMean
78.	FrequencyBodyGyroscopeJerkMagnitudeStandard_Deviation
79.	FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency
80.	angletBodyAccelerometerMeangravity
81.	angletBodyAccelerometerJerkMeangravityMean
82.	angletBodyGyroscopeMeangravityMean
83.	angletBodyGyroscopeJerkMeangravityMean
84.	angleXgravityMean
85.	angleYgravityMean
86.	angleZgravityMean

All mean values are numeric
## Actions Done 

1.Data Aggregation - The following separate data source were combined into one table : 
Subject_train  
y_Train 
X_Train
Subject_test
y_test
X_test

2.Selecting the measurements that contain mean or std in their name. The exercise was not explicitly defined the selection criteria, so I choose the broad interpretation, and select all observations that contain std or mean in their names.

3. The Activity index were changed from an interger to a charchter , whhice is the activity names (see above)

4. All observation variables were changed to the name of the observations (see above) with some cleaning work : 
  removed all -, ( and ) 
  Replaced ACC by Acceleerometer
  Replaced Gyro by  Gyroscope
  Replaced Mag by Magnitude 
  Repalced starting f or Freq by Frequancy 
  Corrected mean to Mean 
  Corrected std  to Standard_Deviation
  Replaced starting t by Time 
  Removed duplicate body body 
  
5. The final step is to create the tidy dataset which contains means values of all subjects per activities of the selected above observations.





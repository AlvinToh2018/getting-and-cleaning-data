File and data structure
=======================

The data is normalised into multiple files

Base Dir
- labels :
	(types of activity - codes and descriptions - with the codes to be used in the training/test data)
- features :
	the different data features collected by the Samsung device (accelerometer and gyroscope 3-axial)


Sub-folders
- the human subjects :
	(1-32) for each corresponding record in the collected data
- X data :
	The collected data
- Y data :
	The activity (labels) for each corresponding line of recorded data


Analysis / work done
====================
START

1. Load in the features

2. determine the fearures needed so that we can extract those and work on a smaller set of collected data

3. Load in the data :
	the recorded data (training & test), subjects

4. Re-construct / de-normalise the training and test data :
	merge the (human) subject, (activity) label, recorded data cols together
	merge the training and test data together (append below)

5. Give descriptive names i.e. replace the number codes with descriptive text of the activity (walking etc ..)

6. Find the means as instructed

7. Give descriptive names (instead of Group-1, Group-2) to the cols we group-by when using the aggregate function

8. Output as file 'submit_tidy_data.txt'

END

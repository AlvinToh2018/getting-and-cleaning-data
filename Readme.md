File and data structure
=======================

The source data is normalised into multiple files

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


Running the Analysis
====================

The analysis is done within a single R script file 'run_analysis.R'

It reads the source files mentioned above and outputs the results into a file named 'submit_tidy_data.txt'

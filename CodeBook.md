Analysis / work done
====================

START

1. Load in the features

2. Determine the fearures needed so that we can extract those and work on a smaller set of collected data

3. Load in the data : the recorded data (training & test), subjects

4. Re-construct / de-normalise the training and test data : merge the (human) subject, (activity) label, recorded data cols together merge the training and test data together (append below)

5. Give descriptive names i.e. replace the number codes with descriptive text of the activity (walking etc ..)

6. Find the means as instructed

7. Give descriptive names (instead of Group-1, Group-2) to the cols we group-by when using the aggregate function

8. Output as file 'submit_tidy_data.txt'

END

Note: The analysis is also documented as comments within the code

New variables created
=====================
1. features: list of all features

2. features_need: feactures containing mean (‘mean’)and standard deviation(‘std’)

3. data_train / data_test: training / test set

4. data_train_need / data_test_need: training / test set with features we need, those containing mean and standard deviation

5. label_train / label_test: training / test labels

6. subject_train / subject_test: each row identifies the subject who performed the activity for each window sample for training / test set

7. train / test: training / test set together with subject and activity

8. mergeddata: merged data set including both train and test

9. activity_labels: link class labels with their activity name

10. summary_data: summary data set with the average of each variable for each activity and each subject

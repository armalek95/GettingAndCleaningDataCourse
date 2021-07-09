All data was loaded into R using read.table, specifying the encoding for the ones that were not encoded in UTF-8.

All intermediary data sets were removed using rm() to preserve memory.

Original label sets contain a number from 1 to 6 representing an activity as described in the Activity Labels file:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The approach I followed was to convert the label column in my dataset "extraction" to characters and then applied logical vectors to subset parts of the dataset and exchange them for the more descriptive label. (lines 46 to 52 of the run_analysis.R file)

dplyr library was used for all data manipulations

The following variable names were used to describe the tidy data:

mean - average or mean as calculated using mean() function
st.dev - standard deviation calculated using sd() function
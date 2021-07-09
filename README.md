# GettingAndCleaningDataCourse
Repository of my analysis for the Getting and Cleaning Data Course at Coursera
Cancel changes
This repository was established for the peer review of my last assignment of the Getting and Cleaning Data Course by Johns Hopkins at Coursera.

I contains the following files:

CodeBook.md - file containing some extra explanations of the data and how I pulled it together  
run_analysis.R - file containing the script for the entire assignment, from data loading to tidy dataset  
UCI HAR Dataset - dataset folder provided for the assignment and from where the data is loaded for the assignment  


An easy way to read the file is to use:  

data <- read.table("tidy_dataset.txt", header = TRUE)  
View(data)


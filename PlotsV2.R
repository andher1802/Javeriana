#plotting differences
library(ggplot2)
library(grid)

setwd("/home/andresh/Documents/software/Javeriana/CSVFiles")
data = read.csv("./AllMusclesCompiled.csv", header = FALSE, sep=',')
names(data) <- c('EMG', 'BWSLevel', 'Speed', 'MuscleGroup')

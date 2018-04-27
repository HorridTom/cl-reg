#create one data.table from a list of many data.frames
#install.packages("data.table")
library(data.table)
merged_datatable<-rbindlist(data_frames)
# This script will load in multiple raw data files.
# each file is registration data for one CL Event. 
# Each row corresponds to one registration of one person for this event. 
# All such files will have a name beginning with "REG_Report_"
# Relevant data is contained in the "Delegate_Details" tab

#install tidyverse
install.packages("tidyverse")

#Open tidyverse
library(tidyverse)


#Identify all fileneames starting with "REG_Report_*.xls) in data-raw folder
filenames<-Sys.glob("data-raw/REG_Report_*.xlsx")

#install readxl package
install.packages("readxl")

#open "readxl" to use "read_excel" function
library(readxl)

#create load_REG_files function to load files into R (fn=filenames, fne=fnelement)
load_REG_files<-function(fn){lapply(fn,function(fne){load_files<-read_excel(fne,sheet="Delegate_Details",skip=1)})}


#apply function "load_REG-files" to values "filenames" and assigned to "data_frame"
data_frames<-load_REG_files(filenames)
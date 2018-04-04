# This script will load in the raw data. 
# File is registration data for one CL Event. 
# Each row corresponds to one registration of one person for this event. 
# All such files will have a name beginning with "REG_"
# Relevant data is contained in the "Delegate_Details" tab
library(readxl)
REG_data <- read_excel(path="data-raw/REG_Report_220118.xlsx",sheet="Delegate_Details",skip=1)

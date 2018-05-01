library(stringr)

# Add cleventdate column to REG_data
# Data source spreadsheet lacks cell with date of event. Only the File Name has a date.  

#create_date_col takes two arguments: 
#fileName which is the name of the file containing the registration data
#which should contain the date in the format ddmmyy just before the file extension 
#and preceeded by an underscore.
#df is the data frame that contains the registration data for this date
#
#returns df with an extra column added called cleventdate containing the 
#date of the event on every row
create_date_col <- function(fileName, df) {
  
  fileName_date_pattern <- "_([0-9]*)\\.xlsx"
  event_date <- str_match(fileName, fileName_date_pattern)[,2]
  dt_format <- "%d%m%y"
  event_date <- as.Date(event_date, format = dt_format)
  
  df$cleventdate <- event_date
  
  df
  
}
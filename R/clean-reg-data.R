library(stringr)

# Add cleventdate column to REG_data
# 
fileNames <- Sys.glob("data-raw/REG_*.xlsx")
fileName_date_pattern <- "_([0-9]*)\\.xlsx"
event_dates <- str_match(fileNames, fileName_date_pattern)[,2]
dt_format <- "%d%m%y"

event_dates <- as.Date(event_dates, format = dt_format)

REG_data$cleventdate <- event_dates[1]

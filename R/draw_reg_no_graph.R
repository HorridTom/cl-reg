source('R/clean-reg-data.R')
source('data-raw/load_raw_data.R')
source('R/merge_dataframes.R')
source('R/linegraph_eventdate_attendance.R')

plot_reg_no(df = merged_datatable)
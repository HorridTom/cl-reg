source('R/clean-reg-data.R')
source('data-raw/load_raw_data.R')
source('R/merge_dataframes.R')
source('R/barchart_reg_by_theme.R')

plot_reg_by_theme(merged_datatable)
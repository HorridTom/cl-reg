#plot a graph of sectoraccording to clevent attendance
# df requires a 7 cols namely date and sectors:
  #cleventdate (dates),nhs provider: acute services, nhs provider: mental health, nhs provider: community, nhs commissioners, academic institutions, academic networks

library(tidyverse)

#create required date col
date<-c(as.Date("2018-04-18"),as.Date("2018-07-18"))
v<-sample(date,nrow(REG_data),replace=TRUE,prob=c(0.6,0.4))
REG_data$cleventdate<-v


#select the required columns with relevant data
reg_data_nhs_provider <- REG_data [c("nhs provider: acute services", "nhs provider: mental health", "nhs provider: community",  "nhs commissioners", "academic institutions:", "academic networks:", "cleventdate")]

#make a new col merging all the above cols using the gather function
reg_data_nhs_provider_table <- reg_data_nhs_provider %>% group_by(cleventdate) %>% gather(key = nhs_and_academic_provider, "nhs provider: mental health", "nhs provider: community",  "nhs commissioners", "academic institutions:", "academic networks:", na.rm = TRUE)



#Creating a function that plots the data using the newly created col and the event date col 
plt_sct_clattnd <- function(df){
  sct_clattnd <- ggplot(reg_data_nhs_provider_table, aes(x=cleventdate, fill = nhs_and_academic_provider, colour = nhs_and_academic_provider), group = 1) + 
    geom_bar()  +xlab("CL Event Date") + 
    ylab("Number of Registration ") + 
    ggtitle("Number of CL event registration by sector")
  sct_clattnd
}

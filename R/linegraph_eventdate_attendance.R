#Create line graph of number of attendances for each event
#Code requires tidyverse package
#as.character was used to restrict x axis to not show months between event dates
#Removing as.character means x axis includes months between event dates
#This code requires REG_data to have "cleventdate" variable
#Registration counts can be clarified using this code: "table(REG_data$cleventdate)"

library("tidyverse")
# df= dataframe containing the data to be plotted
# event_date = column containing number of attendances for each event
plot_reg_no <- function(df) {
  reg_no <- ggplot(df, aes( x = as.character(cleventdate), group = 1)) + 
  geom_line(stat = "count") + 
  xlab("CL Event Date") + 
  ylab("Number of attendees") + 
  ggtitle("Line graph of number of attendances for each CL Event")
  reg_no
}

#Assign one of 2 dates to each row in new column
date<-c(as.Date("2018-04-18"),as.Date("2018-07-18"))
v<-sample(date,nrow(REG_data),replace=TRUE,prob=c(0.6,0.4))
REG_data$cleventdate<-v

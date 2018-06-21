

plot_reg_by_theme<- function(merged_datatable) {
  #this code expects merged_datatable, a dataframe whose rows correspond to event registration
  #with column names as per data.R
  
  #Creating column to registrants affiliated with different themes
  merged_datatable$Breathlessness <- ifelse(grepl("Breathlessness", merged_datatable$`clahrc delivery themes proposed workstream`
                                                  , ignore.case = FALSE), "1", "0")
  merged_datatable$Frailty <- ifelse(grepl("Frailty", merged_datatable$`clahrc delivery themes proposed workstream`
                                           , ignore.case = FALSE), "1", "0")
  merged_datatable$Early<- ifelse(grepl("Early", merged_datatable$`clahrc delivery themes proposed workstream`
                                        , ignore.case = FALSE), "1", "0")
  merged_datatable$Public <- ifelse(grepl("Public", merged_datatable$`clahrc delivery themes proposed workstream`
                                          , ignore.case = FALSE), "1", "0")
  merged_datatable$Collaborative <- ifelse(grepl("Collaborative", merged_datatable$`clahrc delivery themes proposed workstream`
                                                 , ignore.case = FALSE), "1", "0")
  merged_datatable$Improvement <- ifelse(grepl("Improvement", merged_datatable$`clahrc delivery themes proposed workstream`
                                               , ignore.case = FALSE), "1", "0")
  merged_datatable$Mental <- ifelse(grepl("Mental", merged_datatable$`clahrc delivery themes proposed workstream`
                                          , ignore.case = FALSE), "1", "0")
  merged_datatable$Patient <- ifelse(grepl("Patient", merged_datatable$`clahrc delivery themes proposed workstream`
                                           , ignore.case = FALSE), "1", "0")
  
  
  
  themes <- c("Breathlessness", "Frailty", "Early", "Public","Collaborative","Improvement", "Mental", "Patient") 
  number_of_registrants_by_theme <- c(sum(as.integer(merged_datatable$Breathlessness)), sum(as.integer(merged_datatable$Frailty)),
                                      sum(as.integer(merged_datatable$Early)) ,sum(as.integer(merged_datatable$Public)), sum(as.integer(merged_datatable$Collaborative)), 
                                      sum(as.integer(merged_datatable$Improvement)),
                                      sum(as.integer(merged_datatable$Mental)), sum(as.integer(merged_datatable$Patient)))
  
  registrants_by_theme<- data.frame(themes, number_of_registrants_by_theme)
  
  ggplot(data=registrants_by_theme,aes(x=themes,y=number_of_registrants_by_theme))+geom_col()
  
}
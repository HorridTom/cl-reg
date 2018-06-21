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



Themes <- c("Breathlessness", "Frailty", "Early", "Public","Collaborative","Improvement", "Mental", "Patient") 
Yes <- c(sum(as.integer(merged_datatable$Breathlessness)), sum(as.integer(merged_datatable$Frailty)),
         sum(as.integer(merged_datatable$Early)) ,sum(as.integer(merged_datatable$Public)), sum(as.integer(merged_datatable$Collaborative)), 
         sum(as.integer(merged_datatable$Improvement)),
         sum(as.integer(merged_datatable$Mental)), sum(as.integer(merged_datatable$Patient)))
         df2 <- data.frame(Themes, Yes)
         
         require(tidyr)
         df.long <- gather(df2, Themes)
         colnames(df.long) <- c("Themes", "variable", "value")
         
         ggplot(data = df.long, aes(x = Themes, y = value, fill = variable)) +
           geom_col(position = position_dodge()) 
#Rasch
install.packages("Hmisc")
library(Hmisc)
install.packages("dplyr")
library(dplyr)

#Find number of participants with 5 days between assessments by deduplicating repeats-37
BBS_FGA5<-Berg_FGA_5_days
BBS_FGA5<-distinct(BBS_FGA5,X, .keep_all=TRUE)
write.csv(BBS_FGA5, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA5.csv")
write.table(BBS_FGA5, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA5s.txt", sep="")


#Find number of participants with 90 days between assessments by deduplicating repeats-93
BBS_FGA90<-Berg_FGA_90_days
BBS_FGA90<-distinct(BBS_FGA90,X,.keep_all = TRUE)
write.csv(BBS_FGA90, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA90.csv")
write.table(BBS_FGA90, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA90.txt", sep="")

#Find number of participants with 180 days between assessments by deduplicating repeats-102
BBS_FGA180<-Berg_FGA_180_days
BBS_FGA180<-distinct(BBS_FGA180,X, .keep_all=TRUE)
write.csv(BBS_FGA180, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA180.csv")
write.table(BBS_FGA180, file="/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BBS_FGA180.txt", sep="")

#Calculate the window of time between tests for each person and generate summary statistics (BBS-FGA)
BF90<-BBS_FGA90
BF90$`BBS_Date Of Evaluation`<-as.Date(BF90$`BBS_Date Of Evaluation`,format="%Y-%m-%d") #tell R the format of the data
BF90$`FGA_Date Of Evaluation`<-as.Date(BF90$`FGA_Date Of Evaluation`,format="%Y-%m-%d")
BF90$assesstime_diff<-as.numeric(difftime(BF90$`BBS_Date Of Evaluation`, BF90$`FGA_Date Of Evaluation`, units = "days")) #as.numeric changes value to just integer
BF90$assesstime_diff.abs<-abs(BF90$assesstime_diff) #absolute value of days

#descriptive statistics of assessment time difference
summary(BF90$assesstime_diff.abs)
var(BF90$assesstime_diff.abs)
sd(BF90$assesstime_diff.abs)


#export BF90 as excel file
install.packages("writexl")
library("writexl")
write_xlsx(BF90,"/Users/jjcash/Documents/PhD/PhD-Year2/Rasch/BF90.xlsx")
library(tidyverse)
library(dplyr)


#Deliverable 1: Linear Regression on the MechCar Data Set
MechaCar<-read.csv("MechaCar_mpg.csv", stringsAsFactors = F, check.names = F)

#Linear Regression
MechaCarLM<-lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=MechaCar)

#Summary for P-Value and R
summary(MechaCarLM)


#Deliverable 2
Suspension<-read.csv("Suspension_Coil.csv", stringsAsFactors = F, check.names = F)

#Total Summary
TotalSummary<-Suspension%>%summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Lot Summary
LotSummary<-Suspension%>%group_by(Manufacturing_Lot)%>%summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = "keep")

#Deliverable 3: T-Test
t.test(Suspension$PSI, mu=1500)

#Lot 
t.test(subset(Suspension, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(Suspension, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(Suspension, Manufacturing_Lot=="Lot3")$PSI, mu=1500)

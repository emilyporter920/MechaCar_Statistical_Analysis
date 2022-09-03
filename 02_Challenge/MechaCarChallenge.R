# ------------- Deliverable 1 -------------
# Adding packages
library(dplyr)
library(tidyverse)

# Reading in MechaCar_mpg CSV file
mecha_car <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors=F)

# Perform the linear regression
linear_regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
                          ground_clearance + AWD, data=mecha_car)

# Get a summary of the linear regression
summary(linear_regression)


# ------------- Deliverable 2 -------------
# Reading in Suspension_Coil CSV file
suspension_coil <- read.csv('Suspension_Coil.csv', check.names = F, 
                            stringsAsFactors = F)

# Use the summarize function to make a total_summary dataframe
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), 
                                               Median=median(PSI), 
                                               Variance=var(PSI), SD=sd(PSI))
  
# Use the group_by & summarize function to make a lot_summary dataframe
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(
  Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)
)

# ------------- Deliverable 3 -------------
# Use the t.test() function on PSI on all manufacturing lots
t.test(lot_summary$Mean, mu=1500)

# 1st t-test
lot_summary1 <- subset(suspension_coil, Manufacturing_Lot == 'Lot1')

t.test(lot_summary1$PSI, mu=1500)

# 2nd t-test
lot_summary2 <- subset(suspension_coil, Manufacturing_Lot == 'Lot2')

t.test(lot_summary2$PSI, mu=1500)

# 3rd t-test
lot_summary3 <- subset(suspension_coil, Manufacturing_Lot == 'Lot3')

t.test(lot_summary3$PSI, mu=1500)

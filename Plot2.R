#Exploratory Data Analysis assignment 1
# Ventcha July 2014
#Plot 2
# There are 4 simple sections:
# load the data: this uses a customised function, 
#     that will also only read the data if it is not already present, using a simple cache-style approach
# Plotting to the screen - simply for a visual look
# Plotting to the file
# any cleanup

#Data loading and preparation
setwd("~/Documents/coursera/Exploratory Data Analysis/Exercise")
source("loadSampleEnergyData.R")
sourceData = loadSampleEnergyData()

#Plot 2
#Plot to screen for initial view
#ensure a single plot, in case this has been reset by other plots
par(mfcol = c(1,1))
with(sourceData,plot(DateTime,Global_active_power, type = "l",ylab="Global Active Power (kilowatts)", xlab = "",main = ""))

#Plot to file
png(file = "plot2.png")
with(sourceData,plot(DateTime,Global_active_power, type = "l",ylab="Global Active Power (kilowatts)", xlab = "",main = ""))
dev.off()

#cleanup
rm(sourceData)

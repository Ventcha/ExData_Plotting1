#Exploratory Data Analysis assignment 1
# Ventcha July 2014
#Plot 3
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

#Plot 3
#Plot to screen for initial view
#ensure a single plot, in case this has been reset by other plots
par(mfcol = c(1,1))
with(sourceData,plot(DateTime,Sub_metering_1, type = "l",ylab="Energy sub metering", xlab = "",main = ""))
with(sourceData,points(DateTime,Sub_metering_2, type = "l", col = "red"))
with(sourceData,points(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Plot to file
png(file = "plot3.png")
with(sourceData,plot(DateTime,Sub_metering_1, type = "l",ylab="Energy sub metering", xlab = "",main = ""))
with(sourceData,points(DateTime,Sub_metering_2, type = "l", col = "red"))
with(sourceData,points(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

#cleanup
rm(sourceData)

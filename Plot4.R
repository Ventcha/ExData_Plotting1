#Exploratory Data Analysis assignment 1
# Ventcha July 2014
# Plot 4
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

#Plot 4
par(mfcol = c(2,2))
# review use of margins: as these should influence the size?
par(mar = c(4,5,2,3))
par(cex = 0.6) #reduce overall size for labels
#Plot to screen for initial view
#a) from plot 2
with(sourceData,plot(DateTime,Global_active_power, type = "l",ylab="Global Active Power", xlab = "",main = ""))
#b) from plot 3
with(sourceData,plot(DateTime,Sub_metering_1, type = "l",ylab="Energy sub metering", xlab = "",main = ""))
with(sourceData,points(DateTime,Sub_metering_2, type = "l", col = "red"))
with(sourceData,points(DateTime,Sub_metering_3, type = "l", col = "blue"))
#add legend: increase relative size of legend text cf to the global cex of 0.5
legend("topright", cex=1.2,lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#c) voltage
with(sourceData,plot(DateTime,Voltage, type = "l", xlab = "datetime"))
#d) reactive power
with(sourceData,plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime"))


#Plot to file
#NOTE:
# a)slightly different  par values for margin and cex as looking at the output, the png and screen devices show slightly differently
# b) the par mfcol needs to be set inside the png device handling, otherwise only the last plot is exported to the file
#     see http://stackoverflow.com/questions/13829365/exporting-multiple-panels-of-plots-and-data-to-png-in-the-style-layout-work?rq=1
png(file = "plot4.png")
par(mfcol = c(2,2))
# review use of margins: as these should influence the size?
par(mar = c(5,5,3,3))
par(cex = 0.8) #reduce overall size for labels
#a) from plot 2
with(sourceData,plot(DateTime,Global_active_power, type = "l",ylab="Global Active Power", xlab = "",main = ""))
#b) from plot 3
with(sourceData,plot(DateTime,Sub_metering_1, type = "l",ylab="Energy sub metering", xlab = "",main = ""))
with(sourceData,points(DateTime,Sub_metering_2, type = "l", col = "red"))
with(sourceData,points(DateTime,Sub_metering_3, type = "l", col = "blue"))
#add legend: increase relative size of legend text cf to the global cex of 0.5
legend("topright", cex=0.95,lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#c) voltage
with(sourceData,plot(DateTime,Voltage, type = "l", xlab = "datetime"))
#d) reactive power
with(sourceData,plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()

#cleanup & reset par() values
par(mfcol = c(1,1))
# review use of margins: as these should influence the size?
par(cex = 1.0) 
rm(sourceData)

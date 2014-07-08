# Simple function to perform the specific load of the energy data for Exploratory Data Analysis Assignment 1
# Ventcha July 2014
# Performs the load, and the subset of data based upon the two required dates
# enhancement could parameterise the date range, but not necessary for now
# RELIES upon the data file being in the directory 'above' the working directory set up in the caller
#       this is because the callers will be in a github repository folder, and the dataset is not included in this
loadSampleEnergyData <- function() {

  #this is to catch the problem where the 'stored' variable does not exist initially
  tryCatch(
    {
      if (!is.null(stored)) {
        message("getting cached data")
        return(stored)
      }
    }, error = function(e) {
      stored <<- NULL
      message("error condition")
    },
    finally = {
      message("finally")
    }  
  )  
 
  # not previously loaded, so will read the file
    message("Load data")
    fulldata = read.table("../household_power_consumption.txt", sep=";",header = T,stringsAsFactors = F)
    #attempted to read in with definition of colClasses, but this threw up an unresolvable error, so resort to a more stepwise approach
    #create a composite datetime for later conversion: this is still a character
    fulldata$DT = paste(fulldata$Date,fulldata$Time)
    #convert to a date, for the filtering
    fulldata$Date = as.Date(fulldata$Date, format = "%d/%m/%Y")
    #str(fulldata) #examine the structure if required
    #filter data for the two dates, into a new dataset
    sample2 = fulldata[fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02",]
    #head(sample2) #look at first few records
    rm(fulldata) #remove the original data to clear out memory
    #convert the columns
    sample2$Global_active_power = as.numeric(sample2$Global_active_power)
    sample2$Global_reactive_power = as.numeric(sample2$Global_reactive_power)
    sample2$Voltage = as.numeric(sample2$Voltage)
    sample2$Global_intensity = as.numeric(sample2$Global_intensity)
    sample2$DateTime = strptime(sample2$DT, format = "%d/%m/%Y %H:%M:%S")
    #summary(sample2) #examine data
    stored <<- sample2
    stored #return
}
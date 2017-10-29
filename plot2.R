# Reading initial data (file household_power_consumption.txt should be in a working directory)
  inData <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subsetting table to include only measurements for 1/2/2007 and 2/2/2007
  dateData <- subset(inData, Date %in% c("1/2/2007","2/2/2007"))

# Converting dates to date/time format
  dateData$Date <- as.Date(dateData$Date,format = "%d/%m/%Y")
  dateData<-cbind(dateData, "DateTime" = as.POSIXct(paste(dateData$Date, dateData$Time)))

# Creating plot
  plot(dateData$Global_active_power ~ dateData$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")


# Creating a png
  dev.copy(png, "plot2.png")
  dev.off()
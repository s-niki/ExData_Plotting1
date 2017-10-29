# Reading initial data (file household_power_consumption.txt should be in a working directory)
  inData <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subsetting table to include only measurements for 1/2/2007 and 2/2/2007
  dateData <- subset(inData, Date %in% c("1/2/2007","2/2/2007"))

# Converting dates to date/time format
  dateData$Date <- as.Date(dateData$Date,format = "%d/%m/%Y")
  dateData<-cbind(dateData, "DateTime" = as.POSIXct(paste(dateData$Date, dateData$Time)))

# Creating plot
  with(dateData, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
  
  lines(dateData$Sub_metering_2 ~ dateData$DateTime, col = 'Red')
  lines(dateData$Sub_metering_3 ~ dateData$DateTime, col = 'Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Creating a png
  dev.copy(png, "plot3.png")
  dev.off()
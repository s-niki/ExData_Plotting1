# Reading initial data (file household_power_consumption.txt should be in a working directory)
  inData <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subsetting table to include only measurements for 1/2/2007 and 2/2/2007
  dateData <- subset(inData, Date %in% c("1/2/2007","2/2/2007"))

# Converting dates to date/time format
  dateData$Date <- as.Date(dateData$Date, format="%d/%m/%Y")
  datetime <- paste(as.Date(dateData$Date), dateData$Time)
  dateData$Datetime <- as.POSIXct(datetime)
  
# Setting layout
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
# Creating plots
  with(dateData, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })

# Creating a png
  dev.copy(png, "plot4.png")
  dev.off()
#Plotting the frequency of Global Active Power on Histogram

#Reading the data
epcdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";", na.strings = "?")

#Converting to Date and extracting for month of Feb
epcdata$Date<-as.Date(epcdata$Date,"%d/%m/%Y")
febdata <- subset(epcdata, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(epcdata)

#Plotting the Graph
datetime <- as.POSIXct(paste(febdata$Date,febdata$Time))
par(mfrow = c(2,2))
plot( datetime, febdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
plot( datetime, febdata$Voltage, type = "l", ylab = "Voltage")
plot(datetime, febdata$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(datetime, febdata$Sub_metering_2, col = "red")
lines(datetime, febdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2 , col = c("black", "red", "blue"))
plot( datetime, febdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
#Copying the file to a png file
dev.copy(png, file = "plot4.png" , height = 480, width = 480)
dev.off()
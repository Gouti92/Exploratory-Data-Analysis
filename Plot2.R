#Plotting the frequency of Global Active Power on Histogram

#Reading the data
epcdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";", na.strings = "?")

#Converting to Date and extracting for month of Feb
epcdata$Date<-as.Date(epcdata$Date,"%d/%m/%Y")
febdata <- subset(epcdata, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(epcdata)

#Plotting the graph
datetime <- as.POSIXct(paste(febdata$Date,febdata$Time))
plot( datetime, febdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

#Copying the file to a png file
dev.copy(png, file = "plot2.png" , height = 480, width = 480)
dev.off()
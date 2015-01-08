# Plot1 Script
# Set file identifier and read the dataset without converting strings to factors
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Segment the data and limit content to the two days specified and reformat the date and times
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Parse out variables and ensure data type for Global_active_power, voltage and metering is numeric
globalActivePower <- as.numeric(subSetData$Global_active_power) 
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 
voltage <- as.numeric(subSetData$Voltage) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 
# Set png file parameters and plot alignment characteristics
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2)) 
# Initiate the plot function to set the axis labels and position the diagrams 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# Set line characteristics
lines(datetime, subMetering2, type="l", col="blue") 
lines(datetime, subMetering3, type="l", col="red") 
# Position legend, plot last diagram, and disconnect png device
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "blue", "red"), bty="o") 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.off()
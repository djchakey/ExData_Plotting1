# Plot2 Script
# Set data file identifier and read the contents
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Filter and segment the data on the two days identified
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
# Reformatthe date and time and ensure the data field are numeric
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData$Global_active_power) 
# Set the png file attributes, initiate the plot function, and disconnect the png device
png("plot2.png", width=480, height=480) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 

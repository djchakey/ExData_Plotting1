# Plot1 Script
# Set datafile identifier and read the contents w/o converting the strings to factors and note decimal points
dataFile<-"./household_power_consumption.txt"
data<-read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter the data on the identified two days
subSetData<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Parse out as numeric the Global_active_power data elements
globalActivePower<- as.numeric(subSetData$Global_active_power)
# Set the png file characteristics and name
png("plot1.png", width=480, height=480)
# Initiate the histogram function with the color and labels identified
hist(globalActivePower, col="blue", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()

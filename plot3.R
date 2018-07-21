##Plot 3 for Exploratory Data Analysis Week 1 Assignment
## Assumes household_power_consumption.txt file located in working directory

##Pull in and subset data to 1st and 2nd Feb 2007

HousePowerCon <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
HPCSub <- subset(HousePowerCon, Date %in% c("1/2/2007","2/2/2007"))

##Convert datetime variables to date and time

HPCDateTime <- strptime(paste(HPCSub$Date, HPCSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
HPCSub <- cbind(HPCSub, HPCDateTime)

HPCSub$Date <- as.Date(HPCSub$Date, format="%d/%m/%Y")
HPCSub$Time <- strptime(HPCSub$Time, format="%T")

##Create PNG File and Plot 3 - Energy Sub Metering by time/day

png("plot3.png", width=480, height=480)
with(HPCSub, plot(HPCDateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(HPCSub$HPCDateTime, HPCSub$Sub_metering_2,type="l", col= "red")
lines(HPCSub$HPCDateTime, HPCSub$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
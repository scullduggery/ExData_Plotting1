##Plot 1 for Exploratory Data Analysis Week 1 Assignment
## Assumes household_power_consumption.txt file located in working directory

##Pull in and subset data to 1st and 2nd Feb 2007

HousePowerCon <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
HPCSub <- subset(HousePowerCon, Date %in% c("1/2/2007","2/2/2007"))

##Convert datetime variables to date and time

HPCSub$Date <- as.Date(HPCSub$Date, format="%d/%m/%Y")
HPCSub$Time <- strptime(HPCSub$Time, format="%T")

##Create Histogram Plot 1 to PNG file - Frequency of Global Active Power (Kilowatts)

png("plot1.png", width=480, height=480)
hist(HPCSub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()


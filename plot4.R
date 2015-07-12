#read the Raw data. 
raw <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c('character', 'character', 'numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))

# Convert the Date
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")

# Lets make this much smaller - subset for Feb 1 and 2 of 2007
raw <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02")

# Combine date and time and make it time
raw$DateTime = strptime(paste(raw$Date, raw$Time), "%Y-%m-%d %H:%M:%S")


#open the PNG File - this is Plot2
png("plot4.png", width = 480, height = 480, units = "px")


#we are doing a 2 x 2 grid
par(mfrow = c(2, 2))

#This is the same as plot2
plot(raw$DateTime, raw$Global_active_power, ylab='Global Active Power', xlab='', type='l')

#New plot of Voltage.
plot(raw$DateTime, raw$Voltage, ylab='Voltage', xlab='', type='l')

#This is the same as Plot3.
plot(raw$DateTime, raw$Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
lines(x=raw$DateTime,y=raw$Sub_metering_2, type="l",col="red")
lines(x=raw$DateTime,y=raw$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

#New plot showign the global reactive power.
plot(raw$DateTime, raw$Global_reactive_power, ylab = 'Global_reactive_power', xlab='datetime', type='l')

#close the PNG file.
dev.off()
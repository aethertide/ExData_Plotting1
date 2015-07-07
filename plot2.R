#read the Raw data. 
raw <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c('character', 'character', 'numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))

# Convert the Date
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")

# Lets make this much smaller - subset for Feb 1 and 2 of 2007
raw <- subset(raw, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# Combine date and time and make it time
raw$DateTime = strptime(paste(raw$Date, raw$Time), "%Y-%m-%d %H:%M:%S")


#open the PNG File - this is Plot2
png("plot2.png", width = 480, height = 480, units = "px")

#Graph the usage

plot(raw$DateTime, raw$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

#close the PNG file.
dev.off()
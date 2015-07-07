#read the Raw data. 
raw <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c('character', 'character', 'numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))


# Convert the Date
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")

# Lets make this much smaller - subset for Feb 1 and 2 of 2007
raw <- subset(raw, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

#open the PNG File - this is Plot1
png("plot1.png", width = 480, height = 480, units = "px")

#create the hist graph. 
hist(raw$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#close the PNG file.
dev.off()
library(Defaults)

# Open a png device with specified dimensions
png("plot4.png", width=480, height=480)

# Since the date format in the input file is different, change the default format
setDefaults('as.Date.character', format = '%d/%m/%Y')

# The data household_power_consumption.zip has been downloaded from internet
# and unzipped to working directory.
# It contains only file 'household_power_consumption.txt' which is read below
dat <- read.csv("household_power_consumption.txt", sep = ';', header = TRUE, colClasses = c("Date","character", rep("numeric",7)),na.strings="?")

# Subset the data to read the parameters for only the specified dates
subdat <- subset(dat, Date == "01/02/2007" | Date == "02/02/2007")

# Convert the date and time to datetime format
dateTime <- strptime( paste(subdat$Date,subdat$Time), format="%Y-%m-%d %H:%M:%S")

# Create a 2 X 2 area for holding the plots
par(mfrow=c(2,2))

# Create the plot for Global Active Power
plot(dateTime, subdat$Global_active_power, type = "l", ylab="Global Active Power", xlab="")

# Create the plot for Voltage
plot(dateTime,subdat$Voltage,type="l",xlab="datetime", ylab="Voltage")

# Create the plot for Metering
plot(dateTime, subdat$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(dateTime, subdat$Sub_metering_2, col="Red")
lines(dateTime, subdat$Sub_metering_3, col="Blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, cex = 0.75)

# Create the plot for Global Reactive Power
plot(dateTime,subdat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", yaxt="n")
axis(2, cex.axis=0.8)

# Close the device
dev.off()

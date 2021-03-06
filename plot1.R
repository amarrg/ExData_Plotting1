library(Defaults)

# Open a png device with specified dimensions
png("plot1.png", width=480, height=480)

# Since the date format in the input file is different, change the default format
setDefaults('as.Date.character', format = '%d/%m/%Y')

# The data household_power_consumption.zip has been downloaded from internet
# and unzipped to working directory.
# It contains only file 'household_power_consumption.txt' which is read below
dat <- read.csv("household_power_consumption.txt", sep = ';', header = TRUE, colClasses = c("Date","character", rep("numeric",7)),na.strings="?")

# Subset the data to read the parameters for only the specified dates
subdat <- subset(dat, Date == "01/02/2007" | Date == "02/02/2007")

# Draw the histogram with columns in red color
hist(dat1$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main="Global Active Power")

# Close the device
dev.off()

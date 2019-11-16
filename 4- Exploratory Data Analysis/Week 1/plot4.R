# Reading the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   dec = ".", na.strings = "?", stringsAsFactors = F)
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
str(data) # all numeric, except Date & Time

# Modifying the time with lubridate
library(lubridate)
timeSeries <- dmy_hms(paste(data$Date, data$Time))

# making & saving the plot
png("plot4.png", width = 480, height = 480)
# split charts
par(mfrow =c(2, 2))
# top left
plot(timeSeries, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# top right
plot(x = timeSeries, y = data$Voltage, type = "l", xlab = "datatime", ylab = "Voltage")
# bottom left
plot(timeSeries, data$Sub_metering_1, xlab = "", ylab = "Energy Submetering", type = "l")
lines(x = timeSeries, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = timeSeries, y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"), cex = 0.7)
# bottom right
plot(x = timeSeries, y = data$Global_reactive_power, type = "l",
     xlab = "datatime")
dev.off()






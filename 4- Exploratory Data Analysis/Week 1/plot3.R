# Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", dec = ".",
                   header = T, stringsAsFactors = F, na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
str(data) # data$Global_active_power is numeric $ Sub_metering_1:3

# Modifying the time with lubridate
library(lubridate)
timeSeries <- dmy_hms(paste(data$Date, data$Time))

# making & saving the plot
png("plot3.png", width = 480, height = 480)
plot(x = timeSeries, y = data$Sub_metering_1,
     xlab = "", ylab = "Energy Submetering", type = "l")
lines(x = timeSeries, y = data$Sub_metering_2,
      type = "l", col = "red")
lines(x = timeSeries, y = data$Sub_metering_3,
      col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()

# Reading the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?", stringsAsFactors = F, dec = ".")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
str(data) # data$Global_active_power is numeric

# Modifying the time with lubridate
library(lubridate)
timeSeries <- dmy_hms(paste(data$Date, data$Time))

# making & saving the plot
png("plot2.png", width = 480, height = 480)
# type = l (lines)
plot(x = timeSeries, y = data$Global_active_power, type = "l",
    xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

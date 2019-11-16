## 1.
## First calculate a rough estimate of how much memory the dataset will require in memory before reading into R.
# The dataset has 2,075,259 rows and 9 columns.
# size: 8 bytes/numeric
2075259 * 9 * 8
  # Answer:
  # [1] 149418648 bytes
149418648 / 2^20 # bytes/MB
  # Answer:
  # [1] 142.4967 MB
# My computer has enough memory


## 2.
# Reading the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings = "?", dec=".")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
str(data) # data$Global_active_power is numeric

# making & saving the plot
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()












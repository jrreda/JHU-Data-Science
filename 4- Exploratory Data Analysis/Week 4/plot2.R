## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") # National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips=="24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
baltimore_data <- subset(NEI, fips == "24510")

# making the plot
png(filename = "plot2.png")
plot(x = unique(baltimore_data$year),
     y = tapply(baltimore_data$Emissions, baltimore_data$year, sum),
     pch = 19, type = 'b',
     xlab = "Year",
     ylab = "Total emissions of PM2.5 (tons)",
     main = "Total Emissions of PM2.5 in Baltimore City, Maryland")
dev.off()

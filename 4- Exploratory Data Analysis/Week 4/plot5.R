## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") # National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources
# changed from 1999-2008 in Baltimore City?
# Type: ON-ROAD, Fips = "24510" Baltimore Motor Vehicle PM[2.5]* Emissions

baltimore_data <- subset(NEI, fips == "24510" & type == 'ON-ROAD')

# making the plot
png(filename = "plot5.png")
plot(x = unique(baltimore_data$year),
     y = tapply(baltimore_data$Emissions, baltimore_data$year, sum),
     pch = 19, type = 'b',
     xlab = "Year",
     ylab = "Total emissions of PM2.5 (tons)",
     main = "Baltimore Motor Vehicle PM[2.5] Emissions From 1999 to 2008")
dev.off()

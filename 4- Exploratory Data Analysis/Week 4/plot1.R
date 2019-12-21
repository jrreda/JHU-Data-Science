## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") # National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")



# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system,
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# aggregate(Emissions ~ year, NEI, sum), aslo works.
png(filename = "plot1.png")
plot(x = unique(NEI$year),
     y = tapply(NEI$Emissions, NEI$year, sum),
     pch = 19, type = 'b',
     xlab = "Year",
     ylab = "Total emissions of PM2.5 (tons)",
     main = "Total Emissions of PM2.5 in the United States")
dev.off()

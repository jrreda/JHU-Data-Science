## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") # National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

# Baltimore City
baltimore_california <- subset(NEI, fips == "24510" | fips == "06037"
                               & type == 'ON-ROAD')

data <- aggregate(baltimore_california$Emissions,
                  by = list(baltimore_california$year, baltimore_california$fips),
                  FUN = sum)
colnames(data) <- c('Year', 'City', 'Emissions')
data$City[data$City == '24510'] <- "Baltimore"
data$City[data$City == '06037'] <- "California"

library(ggplot2)
# making the plot
png(filename = "plot6.png")
qplot(x = Year, y = Emissions, data=data, color = City, geom = 'line') +
  geom_point(shape=21, color="black", fill="#69b3a2", size=4)+
  xlab("Year") +
  ylab("Total Emissions from motor vehicles (tons)") + 
  ggtitle("Emissions of PM2.5 in Baltimore VS California")
dev.off()

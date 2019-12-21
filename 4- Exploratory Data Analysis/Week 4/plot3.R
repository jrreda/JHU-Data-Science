## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") # National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999-2008
# for Baltimore City? Which have seen increases in emissions from 1999-2008? 
baltimore_data <- subset(NEI, fips == "24510")
baltimore_type_date <- aggregate(baltimore_data$Emissions,
                                 by=list(baltimore_data$year, baltimore_data$type),
                                 sum)
colnames(baltimore_type_date) <- c('year', 'type', 'emissions')

# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
png(filename = "plot3.png")
g <- ggplot(baltimore_type_date, aes(x=year, y=emissions))
g + geom_line(aes(color=type), size=2) + 
  labs(x = "Years",
       y = "Total emissions of PM2.5 (tons)",
       title = "Total Emissions of PM2.5 in Baltimore City by pollutant type")
dev.off()

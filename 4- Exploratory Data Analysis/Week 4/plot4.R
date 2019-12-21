## Reading the data
NEI <- readRDS("summarySCC_PM25.rds") #National Emissions Inventory (NEI)
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999-2008? 

coal_data <- SCC[grep('Coal', SCC$Short.Name), ]
library(dplyr)
coal_data$SCC <- as.character(coal_data$SCC)
data <- inner_join(NEI, coal_data, by='SCC')

# making the plot
png(filename = "plot4.png")
plot(x = unique(data$year),
     y = tapply(data$Emissions, data$year, sum),
     pch = 19, type = 'b',
     xlab = "Year",
     ylab = "Total emissions of PM2.5 (tons)",
     main = "Total Emissions of PM2.5 across the United States")
dev.off()

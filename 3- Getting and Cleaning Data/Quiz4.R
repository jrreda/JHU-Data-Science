
## Q1 
# The American Community Survey distributes downloadable data about United States communities.
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "./acs.csv", method = "curl")
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
acs <- read.csv("acs.csv")
# Apply strsplit() to split all the names of the data frame on the characters "wgtp".
# What is the value of the 123 element of the resulting list?
strsplit(names(acs), "wgtp")[[123]]
  # Answer
  # [1] ""   "15"



## Q2
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "./GDP.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip=4, nrows = 190)[, c(1, 2, 4, 5)]
colnames(gdp) <- c("CountryCode", "Rank", "Economy", "Total")
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
mean(as.numeric(gsub(",", "", gdp$Total)))
  # Answer
  # [1] 377652.4



## Q3
# In the data set from Question 2 what is a regular expression that would allow you
# to count the number of countries whose name begins with "United"?
# Assume that the variable with the country names in it is named countryNames.
# How many countries begin with United?
grep("^United", gdp$Economy)
  # Answer:
  # [1]  1  6 32
grep("^United", gdp$Economy, value = T)
  # [1] "United States"        "United Kingdom"       "United Arab Emirates"




## Q4
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "./GDP.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip=4, nrows = 190)[, c(1, 2, 4, 5)]
colnames(gdp) <- c("CountryCode", "Rank", "Economy", "Total")
# Load the educational data from this data set:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile = "./educational.csv", method = "curl")
edu <- read.csv("educational.csv")
# Match the data based on the country shortcode.
library(dplyr)
gdp_edu <- inner_join(gdp, edu)
# for which the end of the fiscal year is available, how many end in June?
length(grep("Fiscal year end: June", gdp_edu$Special.Notes))
  # Answer:
   # [1] 13




## Q5
# You can use the quantmod (http://www.quantmod.com/) package to get 
# historical stock prices for publicly traded companies on the NASDAQ and NYSE.
# Use the following code to download data on Amazon's stock price and get the times the data was sampled.
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
# How many values were collected in 2012? How many values were collected on Mondays in 2012?
amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
length(amzn2012)
# [1] 250
NROW(amzn2012[weekdays(amzn2012) == "Monday"])
# [1] 47

### Quiz 1


## Q1: How many properties are worth $1,000,000 or more?
  # VAL attribute says how much property is worth.
  # VAL == 24 means more than $1,000,000
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "./ss06hid.csv", method = "curl")
# Read the .csv data
houses <- read.csv("ss06hid.csv")
# Load the dplyr library
library(dplyr)
nrow(filter(houses, VAL == 24)) 
  # Answer: 
  # 53



## Q2: Use the data you loaded from Question 1. Consider the variable FES in the code book.
## Which of the "tidy data" principles does this variable violate?
  # Answer:
  # Tidy data one variable per column.



## Q3: Download the Excel spreadsheet on Natural Gas Aquisition Program here:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              destfile = "./naturalGas.xlsx", method = "curl")
  # Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat
dat <- read.xlsx("naturalGas.xlsx", rows = 18:23, cols = 7:15)
  # What is the value of:
sum(dat$Zip*dat$Ext,na.rm=T)
  # Answer:
  # 36534720



## Q4: Read the XML data on Baltimore restaurants from here:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              destfile = "./Baltimore_restaurants.xml", method = "curl")
doc <- xmlTreeParse("Baltimore_restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
zipcode_df <- data.frame(zipcode = zipcodes)
  # How many restaurants have zipcode 21231?
length(zipcode_df[zipcode_df$zipcode == 21231, ])
    # Answer:
    # 127



## Q5 The American Community Survey distributes downloadable data about United States communities.
## Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile = "./quest5.csv", method = "curl")
  # using the fread() command load the data into an R object: DT
DT <- fread("quest5.csv")
  # broken down by sex. Using the data.table package, which will deliver the fastest user time?
system.time(DT[,mean(pwgtp15),by=SEX])
    # Answer:     
    # user  system elapsed 
    # 0       0       0 
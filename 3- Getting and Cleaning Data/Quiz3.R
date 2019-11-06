## Q1 
# The American Community Survey distributes downloadable data about United States communities.
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "./acs.csv", method = "curl")
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products.
# Assign that logical vector to the variable agricultureLogical.
# Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
acs <- read.csv("acs.csv")
agricultureLogical <- (acs$ACR == 3 & acs$AGS == 6)
which(agricultureLogical)
   # Answer:
    # [1]  125  238  262 



## Q2
# Using the jpeg package read in the following picture of your instructor into R
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",
              destfile = "./jeff.jpg", method = "curl", mode = "wb")
pic <- readJPEG("jeff.jpg", native = TRUE)
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?
# (some Linux systems may produce an answer 638 different for the 30th quantile)
quantile(pic, probs = c(0.3, 0.8))
  # Answer:
#       30%       80% 
#   -15259150 -10575416



## Q3
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
gdp_edu <- arrange(inner_join(gdp, edu), desc(Rank))
# How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last).
nrow(gdp_edu) # [1] 189
# What is the 13th country in the resulting data frame?
gdp_edu[13, ]$Economy # [1] St. Kitts and Nevis



## Q4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
gdp_edu %>% group_by(Income.Group) %>%
  filter(Income.Group %in% c("High income: OECD", "High income: nonOECD")) %>%
  summarize(averageRank = mean(Rank, na.rm = T)) %>%
  arrange(desc(Income.Group))
    # Answer:
# A tibble: 2 x 2
# Income.Group            averageRank
# <fct>                         <dbl>
# 1 High income: OECD           33.0
# 2 High income: nonOECD        91.9



## Q5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
Q5 <- cut(gdp_edu$Rank, breaks = 5)
# How many countries are Lower middle income but among the 38 nations with highest GDP?
table(Q5, gdp_edu$Income.Group)[1, "Lower middle income"]
  # Answer:
  # [1] 5

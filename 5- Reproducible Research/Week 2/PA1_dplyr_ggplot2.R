library(dplyr)
library(ggplot2)

## Loading and preprocessing the data
df <- read.csv("activity.csv", na.strings = 'NA', header = T)
df$date <- as.Date(as.character(df$date))



## What is mean total number of steps taken per day?
daily <- df %>% group_by(date) %>% na.omit() %>%
    summarise(totalSteps = sum(steps))
# Make a histogram of the total number of steps taken each day
qplot(daily$totalSteps, bins = 30,
      xlab = "number of steps",
      main = "total number of steps taken per day")
# Calculate and report the mean and median of the total number of steps taken per day
mean(daily$totalSteps)
median(daily$totalSteps)



## What is the average daily activity pattern?
intervally <- df %>% group_by(interval) %>% na.omit() %>%
    summarise(avgSteps = mean(steps))
# Make a time series plot 
qplot(x = interval, y = avgSteps, data = intervally, geom = 'line',
      ylab = "average steps",
      main = "The average daily activity pattern")
# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
intervally %>% filter(avgSteps == max(avgSteps))


## Imputing missing values
# the total number of missing values in the dataset
sum(is.na(df))

# Create a new dataset that is equal to the original dataset but with the missing data filled in.
imputedDF <- df %>% replace(is.na(df), mean(df$steps, na.rm = T))
summary(imputedDF)
# Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. 
daily_imputed <- imputedDF %>% group_by(date) %>% na.omit() %>%
    summarise(totalSteps = sum(steps))
qplot(daily_imputed$totalSteps, bins = 30,
      xlab = "number of steps",
      main = "total number of steps taken per day")
# Compare the mean and median of Old and New data
mean(daily_imputed$totalSteps)
median(daily_imputed$totalSteps)


## Are there differences in activity patterns between weekdays and weekends?
imputedDF$days <- weekdays(imputedDF$date)
imputedDF$days <- ifelse(imputedDF$days=="Saturday" | imputedDF$days=="Sunday",
                         "weekend", "weekday")
# Make a panel plot containing a time series plot of the 5-minute interval
imputedDF <- imputedDF %>% group_by(interval, days) %>%
    summarise(avgSteps = mean(steps))
ggplot(data = imputedDF, aes(x=interval, y=avgSteps, color=days)) + 
    geom_line() + facet_grid(days ~ .) + xlab("interval") +
    ylab("average steps") +
    ggtitle("Average number of steps taken in weekdays or weekends")




















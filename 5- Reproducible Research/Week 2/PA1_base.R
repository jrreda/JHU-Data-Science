df <- read.csv("activity.csv", na.strings = "NA", header = T)
df$date <- as.Date(as.character(df$date))

hist(tapply(df$steps, df$date, mean, na.rm = T), breaks = 20,
     xlab = "number of steps per day",
     main = "total number of steps taken each day")

mean(df$steps > 0, na.rm = T)
median(df$steps > 0, na.rm = T)



plot(aggregate(df$steps,by = list(df$date),FUN = mean, na.rm=T),
     type = 'l', xlab = "days", ylab = "average of steps",
     main = "total number of steps taken each day")


# The 5-minute interval that, on average, contains the maximum number of steps
par(mfrow=c(1,1))

plot(aggregate(df$steps,by = list(df$interval),FUN = mean, na.rm=T),
     type = 'l', xlab = "intervals", ylab = "average of steps",
     main = "total number of steps taken each day")

# Code to describe and show a strategy for imputing missing data
summary(df)
nrow(subset(df, steps == 0)) / nrow(df) * 100 
nrow(df[is.na(df$steps),]) / nrow(df) * 100
df$steps[is.na(df$steps)] <- mean(df$steps, na.rm = T)

# Histogram of the total number of steps taken each day after
# missing values are imputed
hist(tapply(df$steps, df$date, mean), breaks = 20,
     xlab = "number of steps per day",
     main = "total number of steps taken each day")

# Panel plot comparing the average number of steps taken per 5-minute interval 
# across weekdays and weekends

weekdays(df$date)
df$date[]


    
    

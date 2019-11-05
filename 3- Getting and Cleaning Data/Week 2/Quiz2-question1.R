library(sqldf)

# Download the American Community Survey data and load it into an R object called: acs
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile = "./acs.csv", method = "curl")
acs <- read.csv("acs.csv")

## Q1 Which of the following commands will select only the data for 
## the probability weights pwgtp1 with ages less than 50?
sqldf("select pwgtp1 from acs where AGEP < 50")

## Q2 Using the same data frame you created in the previous problem,
## what is the equivalent function to unique(acs$AGEP)
Z <- unique(acs$AGEP)
B <- sqldf("select distinct AGEP from acs")
identical(Z, B$AGEP)
# TRUE

## Q4 How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
## http://biostat.jhsph.edu/~jleek/contact.html
# (Hint: the nchar() function in R may be helpful)
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)

answer <- numeric()
for (n in c(10, 20, 30, 100)) {
  numOfCharacters <- nchar(htmlCode[n])
  answer <- c(answer, numOfCharacters)
}
answer
# [1] 45 31  7 25



## Q5 Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
# This is a fixed width file. Use read.fwf() to read it:
x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip = 4,
  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))

sum(x[, 4])
  # Answer    
  # [1] 32426.7
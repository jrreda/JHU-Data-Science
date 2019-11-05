rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data, COLS: HospitalName, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2, 7, 11, 17, 23)]
  colnames(data) <- c("Name", "State", "heart attack", "heart failure", "pneumonia")

  ## Check that state and outcome are valid
  if (!state %in% data$State) {stop(print("-- invalid state --"))}
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {stop(print("-- invalid outcome --"))}
  
  ## Return hospital name in that state with the given rank
    # data frame for the specific state -- input --
  data <- data[data$State == state, ][, c("Name", "State", outcome)]
    # convert outcome column form character to numeric
  data[, 3] <-  suppressWarnings(as.numeric(data[, 3]))
    # order data by output --input & Name
  data <- data[order(data[, outcome], data$Name, na.last = NA), ]

  ## 30-day death rate
  if (num == "best") {return(data[1, 1])}
  if (num == "worst") {return(data[nrow(data), 1])}
  if (class(num) == 'numeric' & num > nrow(data)) {return(NA)}
  else{
    return(data[num, 1])
  }
}


## try out the rankhosbital function
rankhospital("TX", "heart failure", 4)
  # [1] "DETAR HOSPITAL NAVARRO"
rankhospital("TX", "heart attack", 1)
  # [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
rankhospital("MD", "heart attack", "worst")
  # [1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("AL", "pneumonia", "best")
  # [1] "MARSHALL MEDICAL CENTER NORTH"
rankhospital("AL", "pneumonia", 500)
  # [1] NA
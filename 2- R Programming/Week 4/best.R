best <- function(state, outcome) {
  ## Read outcome data, COLS: HospitalName, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2, 7, 11, 17, 23)]
  colnames(data) <- c("Name", "State", "heart attack", "heart failure", "pneumonia")
  
  ## Check that state and outcome are valid
  if (!state %in% data$State) {stop(print("-- invalid state --"))}
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {stop(print("-- invalid outcome --"))}
  
  ## Return hospital name in that state with lowest 30-day death
    # data frame for the specific state -- input --
  data <- data[data$State == state, ][, c("Name", outcome)]
    # convert outcome column form character to numeric
  data[, 2] <- suppressWarnings(as.numeric(data[, 2]))
    
  ## rate
  return(data[order(data[, outcome], na.last = TRUE), ][1, 1])
}




## try out the best function
best("TX", "heart attack")
  # [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
  # [1] "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
  # [1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
  # [1] "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
  # Error in best("BB", "heart attack") : -- invalid state --
best("NY", "hert attack")
  # Error in best("NY", "hert attack") : -- invalid outcome --
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Read outcome data, COLS: HospitalName, State, HeartAttack, HearFailure, Pneumonia
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2, 7, 11, 17, 23)]
  colnames(data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  ## Check that outcome are valid & num
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {stop(print("-- invalid outcome --"))}
  
  ## For each state, find the hospital of the given rank
    # intiate resutl data frame: res_df
  res_df <- data.frame()
  for (state in sort(unique(data$state))) {
    # store the rank of the hosbital by calling rankhospital function
    hosbital <- rankhospital(state, outcome, num)
    # store result of calling rankhospital a data frame df
    df <- data.frame(hosbital, state)
    # combine each row in the df (hosiptal rank according to specific state) in res_df
    res_df <- rbind(res_df, df)
  }
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
  return(res_df)
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)

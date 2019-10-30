complete <- function(directory, id = 1:332){
  # create the path of the directory
  path <- paste0(getwd(),'/',directory)
  
  # create data frame df the will contain all the data according to the given id-s
  df <- data.frame()
  for (i in id) {
    if (i < 10) {
      data <- read.csv(paste0(path,'/00',as.character(i),".csv"), header = T)
    }
    else if (i < 100) {
      data <- read.csv(paste0(path,'/0',as.character(i),".csv"), header = T)
    }
    else{
      data <- read.csv(paste0(path,'/',as.character(i),".csv"), header = T)
    }
    nobs <- sum(complete.cases(data))
    dat <- data.frame(i, nobs)
    df <- rbind(df, dat)
  }
  # retun the total data frame
  return(df)
}

# Example usage
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

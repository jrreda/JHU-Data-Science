corr <- function(directory, threshold = 0){
  # create the path of the directory
  path <- paste0(getwd(),'/',directory)
  
  # create data frame df the will contain all the data according to the given id-s
  df <- data.frame()
  corr_vector <- numeric()
  for (i in 1:332) {
    if (i < 10) {
      data <- read.csv(paste0(path,'/00',as.character(i),".csv"), header = T)
    }
    else if (i < 100) {
      data <- read.csv(paste0(path,'/0',as.character(i),".csv"), header = T)
    }
    else{
      data <- read.csv(paste0(path,'/',as.character(i),".csv"), header = T)
    }
  
    df <- data[complete.cases(data),]
    if (nrow(df) > threshold) {
      corr_vector <- c(corr_vector, cor(df[,"sulfate"], df[, "nitrate"]))
    }
  }
  # retun the correlation vector
  return(corr_vector)
}

# Example usage
cr <- corr("specdata", 150)
head(cr,6)
summary(cr)
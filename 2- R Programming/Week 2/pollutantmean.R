pollutantmean <- function(directory, pollutant, id = 1:332){
  # create the path of the directory
  path <- paste0(getwd(),'/',directory)
  
  # create data frame df the will contain all the data according to the given id-s
  df <- data.frame()
  for (i in id) {
    if (i < 10) {
      data <- read.csv(paste0(path,'/00',as.character(i),".csv"), header = T)
      df <- rbind(df, data)
    }
    else if (i < 100) {
      data <- read.csv(paste0(path,'/0',as.character(i),".csv"), header = T)
      df <- rbind(df, data)
    }
    else{
      data <- read.csv(paste0(path,'/',as.character(i),".csv"), header = T)
      df <- rbind(df, data)
    }
  }
  # retun the mean of the overall data 'df' excloding the NAs
  return(mean(df[, pollutant], na.rm = T))
}

# Example usage
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
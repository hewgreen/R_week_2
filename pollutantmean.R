pollutantmean <- function(directory, pollutant, id = 1:322){
  files_list <- list.files(directory, full.names = TRUE) #gets a full name list of files
  temp_dat <- data.frame()
  #cycles through and sticks the quiery files together in temp_dat file
  for (i in id){
    temp_dat <- rbind(temp_dat, read.csv(files_list[i]))
  }
  #finds the mean of the column as defined pollutant can be sulfates or nitrates in this dataset
  #the na.rm ignored the na data
  mean(temp_dat[, pollutant], na.rm = TRUE)
}

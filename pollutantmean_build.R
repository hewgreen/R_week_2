##boshed the files down with this and an unzip

dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")

##names(dat_001) to see the column names
##"Date"    "sulfate" "nitrate" "ID"

##this lad is a list of all the files with their path from the home dir
files <- list.files("specdata/specdata", full.names = TRUE)

##mashing the files together. aparently this is needed here to avoid biasing mean of means etc
dat <- data.frame()
for (i in 1:332) {
  dat <- rbind(dat, read.csv(files[i]))
}

#this code just hangs for a bit but I think it worked as dat now has 772087 obs.

#putting this together in a function

pollutantmean <- function(directory, pollutant, id){
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

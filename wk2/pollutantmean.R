pollutantmean <- function(directory, pollutant, id=1:332) {
  files <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
  dataTbl <- lapply(files, read_csv)
  dataTbl <- do.call(rbind, dataTbl)
  pollutantData <- pull(dataTbl, pollutant)
  mean(pollutantData, na.rm=TRUE)
}
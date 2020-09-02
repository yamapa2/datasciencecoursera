complete <- function(directory, id=1:332) {
  files <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
  dataTbl <- lapply(files, read_csv)
  nobs = sapply(dataTbl, function(dt) { sum(complete.cases(dt)) } )
  data.frame(id, nobs)
}
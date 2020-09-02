corr <- function(directory, threshold = 0) {
  files <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  dataTbl <- lapply(files, read_csv)
  dataTbl <- lapply(dataTbl, function(dt) { dt[complete.cases(dt), ]})
  nobs = sapply(dataTbl, function(dt) { dim(dt)[1] } )
  dataTbl <- dataTbl[nobs > threshold]
  sapply(dataTbl, function(dt) { cor(dt$nitrate, dt$sulfate) })
}
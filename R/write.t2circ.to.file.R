write.t2circ.to.file <- function(df, pattern, speed){
  out.fn <- paste("csv/", params$group, "-T2Circ-", 
                  params$harmonic, "-", 
                  pattern, "-", 
                  speed, 
                  ".csv", sep="")
  write.csv(x = df, file = out.fn, row.names = FALSE)
  sprintf("Wrote output file %s.", out.fn)
}

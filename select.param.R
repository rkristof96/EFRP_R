select.param <- function(index1=i1, index2=i2){
  return(c(
    windowsize=param()[["WindowSize"]][index1],
    correllag=param()[["CorrelLag"]][index2]
  )
  )
}
# select parameters from param function by index
# the possibilities are in param()
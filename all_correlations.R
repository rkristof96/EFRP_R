all_correlations <- function(){
  
  #Inputs for korrel() function
  # store parameters from param() function
  # this step reduces calculation time
  p_Pairs <- param()[["Pairs"]] # name of possible pairs
  p_Date <- param()[["Date"]] # dates from param()
  window_size <- select.param()["windowsize"] # windowsize from param()
  correl_lag <- select.param()["correllag"] # correlation lag from param()
  data_set <-param() # read dataset into data_set variable
  
  solution <-apply(p_Pairs,1, 
                   FUN=function(x){
                     solution <- c(korrel(first = x[1], second = x[2],
                                          timeseries=data_set, windowsize=window_size,
                                          correllag=correl_lag, pDate=p_Date)
                                   ) 
                     return(solution)
                   }
  )
  # param()[["Pairs]] includes the all possible pairs we should iterate
  # iteration by rows
  # the korrel function is applied to rows
  
  
  colnames(solution) <- paste0(p_Pairs[,1],"-",p_Pairs[,2]) # naming correlation matrix
  # the corralations are ordered to the last Date of the window
  #it is not obligatory
  
  sdate <- (param()[["Date"]])
  
  sdate <-as.Date(as.vector(as.matrix(sdate)))[(windowsize+correllag + 1):dim(sdate)[1]]
  # unfortunately, sdate is in tibble format wich is not compatible with matrix format, but Date is
  # to convert sdate to date a vector: tibble->matrix->vector->Date
  # the rolling correlation coefficients are assigned to the last day of the window
  # the choose of date determines the vector in sdate
  
  rownames(solution) <- sdate
  solution <- xts::as.xts(ts(solution, start = sdate[1], end = xts::last(sdate)))
  # convert solution into time series format
  return(solution)
}
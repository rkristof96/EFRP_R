korrel <-function(first="CL1",second="CL2", timeseries=data_set,
                  windowsize=windowsize, correllag=correl_lag, pDate=p_Date)
{
  #function inputs:
    # first = name of first variable
    # second = name of second variable
    # timeseries = dataset, which is stored in param() function and contains all returns
    # windowsize = the size of the rolling window
    # correllag = correlation lag, which determines the difference between first and second time series
    # pDate = pDate stores the dates from param() function for plotting
  
  # calc correlation
  # windowsize & correlag derive from another function
  # it makes easier to create labels

  N <- nrow(read()) - 1 # length of time series
  dN <- N - windowsize - correllag # shorter ts length

  shift <- matrix(rep(0:(dN-1),each=windowsize), byrow = TRUE, ncol=windowsize)
  # shift to select proper windows for correlation calculation
  
  shift_lag <- shift + correllag 
  # shift should be lagged by correllag
  
  w <- matrix(rep(c(1:windowsize), dN), byrow = TRUE, ncol = windowsize, nrow=dN)
  w_0lag <- w + shift
  # first matrix select indexes for the first variable
  w_lag <- w + shift_lag
  # second matrix select indexes for the second variable

  number_of_correlations <- dim(param()[["Pairs"]])[1]
  
  # select time series
  aa <- matrix(timeseries[[first]][w_0lag], byrow=F, ncol=windowsize)
  bb <- matrix(timeseries[[second]][w_lag], byrow=F, ncol=windowsize)
  
  corr_vector <- lineup::corbetw2mat(t(aa),t(bb))
  # calculate correlation between matrix columns by pairs
  # transpose is needed, thus the comparable data are in matrix rows

  date <- dplyr::slice(pDate,((windowsize+1):dim(pDate)[1]))
  mat <- xts::as.xts(ts(corr_vector)) # correlationvector to time series format

  names(mat)<- paste0(first,"-", second) # naming the correlation vector
  
  
  return(mat)
}
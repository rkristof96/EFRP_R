library(readxl)
library(schoolmath)
library(lineup)
library(dplyr)
library(dygraphs)
library(schoolmath)

# setwd("C:/Users/banna/Documents/egyetem/EFRP/R/efrp_r_reizinger-master/efrp_r_reizinger-master")
setwd("C:/Users/Reizinger Kristóf/Desktop/HF/Final")

#0.) Loading functions
source("korrel.R")
source("param.R")
source("read.R")
source("all_correlations.R")
source("select.param.R")

# data
#1.)Set wd
dataset <- c("C:/Users/Reizinger Kristóf/Desktop/HF/Final/WTI2.xlsx")

#2.) Input for reading data
number_of_products <- 3 # 24 # number of analysed products
assertthat::validate_that(is.numeric(number_of_products)==T)

last_col_name <- Excel_colnames_find()[number_of_products + 1] # first col is Date
last_row_number <- 2558 # number of rows
read_range <- paste0("A1:",last_col_name,last_row_number) # converts inputs for Excel format

#3.) 
#a.) param() stores the data
# You should add your input parameters (windowsize and correlation lag) opening opening() function
#b.) korrel() calculate only 1 correlation
#c.)select.param() select one of the possible window size and correlation lag by adding the indexes
# you can rewrite the possibilities in param() function
#Window Size
#view the possibilities
param()[["WindowSize"]]
#choose the index
i1 <-1
#Correlation Lag
#view the possibilities
param()[["CorrelLag"]]
#choose the index
i2 <-1

#d.) all_correlations() output is an xts format table (rows=Date, cols=correlation pairs)

# head(all_correlations())


# 4.) Plot cross-correlations

#making an interactive plot by using "dygraphs" package
source("dyplot.R")
dyplot(all_correlations())


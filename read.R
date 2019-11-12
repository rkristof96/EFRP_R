# prepare reading Excel-file
Excel_colnames_find <- function(){
  # Create Excel Colnames
  # Excel colnames are 3 types: A, AA, AAA 
  Letters2 <- expand.grid(LETTERS,LETTERS) # second type colname
  Letters2 <- sort(paste0(Letters2$Var1,Letters2$Var2)) # sorting in alphabetical order
  colnames2 <- c(LETTERS,Letters2) # A & AA type colnames merging
  Letters3 <- expand.grid(LETTERS,LETTERS, LETTERS) # AAA type 
  colnames3 <- sort(paste0(Letters3$Var1,Letters3$Var2, Letters3$Var3)) # sorting AAA type
  colnames3 <- colnames3[1:(which(colnames3=="XFD"))] # XFD is the last col in EXCEL
  Excel_colnames <- c(colnames2, colnames3) # Merging (A, AA) and AAA type vectors
  
  return(Excel_colnames)
}

#read Excel

read <- function(range=read_range,n=number_of_products){
  # read Excel file
  read <- readxl::read_excel(dataset,col_types = c("date", rep("numeric",n)),
                             col_names=TRUE, range = range)
  
  read$Date <- as.Date(read$Date,"%y-%m-%d", tz = "UTC") #date type
  return(read)
}
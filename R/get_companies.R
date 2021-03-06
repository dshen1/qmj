#' Gets the company names and tickers from the most recent Russell 3000 Index.
#' 
#' Reads in the contents of a text file created from the pdf of company 
#' names and tickers given by the Russell 3000 Index.
#' 
#' @examples
#' get_companies()
#' @importFrom dplyr arrange
#' @export
get_companies <- function() {
  filepath <- system.file("extdata",package="qmj")
  filepath <- paste(filepath, "/companies.txt",sep="")
  companies <- read.csv(filepath,stringsAsFactors=FALSE)
  #filepath2 <- system.file("data",package="qmj")
  #filepath2 <- paste(filepath2,"/companies.RData",sep="")
  companies <- companies[,c("ticker","name")]
  companies <- dplyr::arrange(companies, ticker)
  companies
  #save(companies,file="~/econ20/qmj/data/companies.RData")
  #save(companies,file=filepath2)
}
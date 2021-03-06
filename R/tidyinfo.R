#' Makes raw financial data usable and readable.
#'
#' \code{tidyinfo} works by formatting and curtailing the raw data generated by quantmod (and, by extension, the \code{get_info} function of this package)
#' @param x A list of lists of financial statements. Generated from get_info(companies).
#' @return Returns a data set that is usable by the other functions of this package, as well as being generally more readable.
#' @seealso \code{\link{get_info}}
#' @seealso \code{\link{tidy_prices}}
#' @seealso \code{\link{tidy_cashflows}}
#' @seealso \code{\link{tidy_balancesheets}}
#' @seealso \code{\link{tidy_incomestatements}}
#' @examples
#' data(companies)
#' sub_comps <- companies[1:2,]
#' raw_data <- get_info(sub_comps)
#' financials <- tidyinfo(raw_data)
#' 
#' my_companies <- data.frame(ticker=c("GOOG", "IBM"))
#' raw_data <- get_info(my_companies)
#' financials <- tidyinfo(raw_data)
#' @export

tidyinfo <- function(x){
  #Index is the current structure of the output of the get_info function.
  tidycash <- tidy_cashflows(x[[1]])
  tidyincome <- tidy_incomestatements(x[[2]])
  tidybalance <- tidy_balancesheets(x[[3]])

  financials <- merge(tidybalance, merge(tidycash, tidyincome, by=c("ticker", "year")), by=c("ticker", "year"))
  financials <- unique(financials)
  
  #The columns below are the only ones used in our formulas, and so the other columns are culled out.
  keep <- c("ticker","year","AM","CWC","CX","DIVC",
            "DO","DP.DPL","GPROF","IAT","IBT","NI",
              "NINT","NRPS","RPS","TA","TCA","TCL",
                     "TCSO","TD","TL","TLSE","TREV")
  financials <- financials[keep]
  financials
#   filepath2 <- system.file("data",package="qmj")
#   filepath2 <- paste(filepath2,"/financials.RData",sep="")
#   save(financials,file="~/econ20/qmj/data/financials.RData")
#   save(financials,file=filepath2)
}
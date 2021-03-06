#' Financial statements of all companies in the Russell 3000 index for the past four years
#'
#' A data frame containing all financial statements (balancesheets,
#' cashflows, and income statements) for the past four years if available. 
#' 
#' Some companies may store "weird" data, such as having information solely for the years 1997-2001, or by having multiple 
#' annual reports within the same year (such as one report being filed in March of 2013, and another filed in December of 2013). In the case of companies
#' reporting multiple annual data from the same year, the years of their reports are suffixed with their order. For
#' example, GOOG may have data from 2013.1, 2013.2, 2012.3, 2011.4. This means Google's most recent data set is from
#' 2013 (2013.1), another data set was published in 2013 (2013.2), and the remaining years are also suffixed for convenience.
#' 
#' The main purpose of financials is to provide key information for each company in order to calculate each of the component scores
#' of quality (profitability, growth, safety, and payouts). For every ticker in the \code{\link{companies}} data set, financials
#' will try to store the most recent four years of annual data, though this may vary based on availability.
#' 
#' The Russell 3000 Index is an equity index that tracks the performance of the "3000" (this number may actually
#' vary from year to year, but is always in the neighborhood of 3000) largest
#' US companies as measured by market cap. The component companies that make up this index are
#' reconstituted once a year, usually between May and June. At this reconstitution, all companies
#' are reranked based on their market caps for the year, and any companies which become "ineligible" by,
#' for example, going bankrupt, becoming acquired, or becoming private, are replaced at this time.
#' 
#' This Index was chosen because the majority of the information used in this package relies on
#' data sources that are US-centric, in addition to giving reasonable output by using companies which
#' are at least of sufficient size to produce less erroneous items
#' (such as a tiny company doubling in profitability, though the actual change is very small in magnitude)
#' as well as producing items which are more likely to interest the user.
#' 
#' @format A data frame with 11,112 rows and 23 variables
#'  \itemize{
#'    \item AM = Amortization, of class \code{"character"}.
#'    \item CWC = Changes in Working Capital, of class \code{"character"}.
#'    \item CX = Capital Expenditures, of class \code{"character"}.
#'    \item DIVC = Dividends per Share, of class \code{"character"}.
#'    \item DO = Discontinued Operations, of class \code{"character"}.
#'    \item DP.DPL = Depreciation/Depletion, of class \code{"character"}.
#'    \item GPROF = Gross Profits, of class \code{"character"}.
#'    \item IAT = Income After Taxes, of class \code{"character"}.
#'    \item IBT = Income Before Taxes, of class \code{"character"}.
#'    \item NI = Net Income, of class \code{"character"}.
#'    \item NINT = Interest and Expense - Net Operating, of class \code{"character"}.
#'    \item NRPS = Non-redeemable Preferred Stock, of class \code{"character"}.
#'    \item RPS = Redeemable Preferred Stock, of class \code{"character"}.
#'    \item TA = Total Assets, of class \code{"character"}.
#'    \item TCA = Total Current Assets, of class \code{"character"}.
#'    \item TCL = Total Current Liabilities, of class \code{"character"}.
#'    \item TCSO = Total Common Shares Outstanding, of class \code{"character"}.
#'    \item TD = Total Debt, of class \code{"character"}.
#'    \item TL = Total Liabilities, of class \code{"character"}.
#'    \item TLSE = Total Liabilities and Shareholders' Equity, of class \code{"character"}.
#'    \item TREV = Total Revenue, of class \code{"character"}.
#'  }
#'  
#' @source Google Finance, accessed through quantmod
#' @name financials
#' @seealso \code{\link{companies}}
#' @seealso \code{\link{prices}}
#' @seealso \code{\link{get_info}}
#' @seealso \code{\link{tidyinfo}}
#' @seealso \code{\link{market_data}}
#' @examples
#' data(companies)
#' data(financials)
#' data(prices)
#' sub_comps <- companies[50:51,]
#' market_data(sub_comps, financials, prices)
#' @docType data
#' @keywords data
NULL
% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/get_prices.R
\name{get_prices}
\alias{get_prices}
\title{Gets the daily prices and returns of companies for the past two years.}
\usage{
get_prices(companies)
}
\arguments{
\item{companies}{A data frame of company names and tickers.}
}
\description{
Given a data frame of companies (names and tickers), writes .RData files for every company in the /extdata folder
in the package folder. If canceled partway through, function is able to find and re-read this data, allowing
resumption of progress.
}
\examples{
data(companies)
companies <- companies[1:2,]
get_prices(companies)
}
\seealso{
\code{\link{get_info}}
}


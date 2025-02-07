% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plug.R
\name{plug_list_tokens}
\alias{plug_list_tokens}
\title{List registered tokens for Plug API}
\usage{
plug_list_tokens()
}
\value{
A named list with \code{token} and \code{expiration} fields if a token is found,
or an empty list if no token is stored.
}
\description{
This function lists the stored API token and its expiration time for the Plug API.
If none are found or an error occurs, it displays a message in English ("No token found for Plug API.")
and returns an empty list.
}
\examples{
\donttest{
\dontrun{
plug_list_tokens()
}
}
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grandR.R
\name{get.mode.slot}
\alias{get.mode.slot}
\title{Internal functions to parse mode.slot strings}
\usage{
get.mode.slot(data, mode.slot, allow.ntr = TRUE)
}
\arguments{
\item{data}{a grandR object}

\item{mode.slot}{a mode.slot}

\item{allow.ntr}{whether to allow for the value "ntr" (and throw an error in case)}
}
\value{
a named list with elements mode and slot (or only slot in case of \emph{ntr},\emph{alpha} or \emph{beta})
}
\description{
Internal functions to parse mode.slot strings
}
\details{
A mode.slot is a mode followed by a dot followed by a slot name, or just a slot name. A mode is either \emph{total}, \emph{new} or \emph{old}
}
\concept{helper}

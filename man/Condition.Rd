% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grandR.R
\name{Condition}
\alias{Condition}
\alias{Condition<-}
\title{Get or set the conditions in the column annotation table.}
\usage{
Condition(data, value = NULL)

Condition(data) <- value
}
\arguments{
\item{data}{A grandR object}

\item{value}{Either a vector of column names from the column annotation table, or the condition names themselves}
}
\value{
Either the values of the condition column for Condition(data) or the grandR data object having the new condition column
}
\description{
The conditions column from the column annotation table is used by several functions to stratify the columns (samples or cells)
during the analysis (e.g. to estimate separate kinetic parameters with \code{\link{FitKinetics}} or it is used as covariate for
\code{\link{LFC}} or \code{\link{LikelihoodRatioTest}}). For that reason there are special functions to set and get this column.
}
\details{
If the conditions column does not exist (or has been set to NULL), all analysis functions will work without stratifying samples or cells.
The condition can also be set up directly when loading data, by using \emph{Condition} as one of the design vector entries (see below).

The condition can be set either by \code{data<-Condition(data,names)} or by \code{Condition(data)<-names}.
}
\examples{
sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                  design=c("Cell",Design$dur.4sU,Design$Replicate))

Condition(sars)
Condition(sars) <- c("Cell","duration.4sU.original")
Condition(sars)

sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                  design=c("Condition",Design$dur.4sU,Design$Replicate))
Condition(sars)

}
\seealso{
\link{Coldata}
}
\concept{grandr}

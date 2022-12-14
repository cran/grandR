% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing.R
\name{Scale}
\alias{Scale}
\title{Scale data}
\usage{
Scale(
  data,
  name = "scaled",
  slot = DefaultSlot(data),
  set.to.default = FALSE,
  group = NULL,
  center = TRUE,
  scale = TRUE
)
}
\arguments{
\item{data}{a grandR object}

\item{name}{the new slot name}

\item{slot}{the slot from where to take values}

\item{set.to.default}{set the new slot as default slot}

\item{group}{Perform standardization per group of columns (see details)}

\item{center}{Perform centering (forwarded to \link[base]{scale})}

\item{scale}{Perform scaling (forwarded to \link[base]{scale})}
}
\value{
a new grandR object with a new slot
}
\description{
Compute values for all genes standardized (i.e. z scores) across samples.
}
\details{
Standardization can be done per group. For this, the group parameter has to be a name of the \code{\link{Coldata}} table,
to define groups of columns (i.e. samples or cells).
}
\seealso{
\link[base]{scale}
}
\concept{preprocess}

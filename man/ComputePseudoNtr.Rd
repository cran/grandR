% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing.R
\name{ComputePseudoNtr}
\alias{ComputePseudoNtr}
\title{Compute pseudo NTRs from two count matrices}
\usage{
ComputePseudoNtr(
  data,
  new.slot,
  total.slot = DefaultSlot(data),
  detection.rate = 1
)
}
\arguments{
\item{data}{a grandR object}

\item{new.slot}{the slot containing new RNA counts}

\item{total.slot}{the slot containing total RNA counts}

\item{detection.rate}{the detection rate of T-to-C mismatch reads (see details)}
}
\value{
a new grandR object
}
\description{
NTRs can be computed from given new and total counts.
}
\details{
To correct for some bias, a detection rate (as suggested by Cao et al., Nature Biotech 2020) should be provided. This detection rate
defines, how much new RNA is detected on average using the T-to-C mismatch reads.
}
\concept{data}

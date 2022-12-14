% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{estimate.dispersion}
\alias{estimate.dispersion}
\title{Estimate dispersion parameters for a count matrix using DESeq2}
\usage{
estimate.dispersion(ss)
}
\arguments{
\item{ss}{the count matrix}
}
\value{
a vector of dispersion parameters (to be used as size=1/dispersion for Xnbinom functions)
}
\description{
Estimate dispersion parameters for a count matrix using DESeq2
}
\concept{helper}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diffexp.R
\name{LikelihoodRatioTest}
\alias{LikelihoodRatioTest}
\title{Compute a likelihood ratio test.}
\usage{
LikelihoodRatioTest(
  data,
  name = "LRT",
  mode = "total",
  normalization = mode,
  target = ~Condition,
  background = ~1,
  no4sU = FALSE,
  columns = NULL,
  verbose = FALSE
)
}
\arguments{
\item{data}{A grandR object}

\item{name}{the user defined analysis name to store the results}

\item{mode}{either "total", "new" or "old"}

\item{normalization}{normalize on "total", "new", or "old" (see details)}

\item{target}{formula specifying the target model (you can use any column name from the \code{\link{Coldata}(data)})}

\item{background}{formula specifying the background model (you can use any column name from the \code{\link{Coldata}(data)})}

\item{no4sU}{Use no4sU columns (TRUE) or not (FALSE)}

\item{columns}{logical vector of which columns (samples or cells) to use (or NULL: use all)}

\item{verbose}{Print status updates}
}
\value{
a new grandR object including a new analysis table. The columns of the new analysis table are
\itemize{
 \item{"M"}{the base mean}
 \item{"S"}{the difference in deviance between the reduced model and the full model}
 \item{"P"}{the likelihood ratio test P value}
 \item{"Q"}{same as P but Benjamini-Hochberg multiple testing corrected}
}
}
\description{
The test is computed on any of total/old/new counts using DESeq2 based on two nested models
specified using formulas.
}
\details{
This is a convenience wrapper around the likelihood ratio test implemented in DESeq2.

DESeq2 by default performs size factor normalization. When computing differential expression of new RNA,
it might be sensible to normalize w.r.t. to total RNA, i.e. use the size factors computed from total RNA instead of computed from new RNA.
This can be accomplished by setting mode to "new", and normalization to "total"!
}
\concept{diffexp}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modeling.R
\name{PlotSimulation}
\alias{PlotSimulation}
\title{Plot simulated data}
\usage{
PlotSimulation(
  sim.df,
  ntr = TRUE,
  old = TRUE,
  new = TRUE,
  total = TRUE,
  line.size = 1
)
}
\arguments{
\item{sim.df}{the input data frame}

\item{ntr}{show the ntr?}

\item{old}{show old RNA?}

\item{new}{show new RNA?}

\item{total}{show total RNA?}

\item{line.size}{which line size to use}
}
\value{
a ggplot object
}
\description{
The input data is usually created by \code{\link{SimulateKinetics}}
}
\examples{
PlotSimulation(SimulateKinetics(hl=2))
}
\seealso{
\link{SimulateKinetics} for creating the input data frame
}
\concept{kinetics}

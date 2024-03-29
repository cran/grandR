% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modeling.R
\name{FitKineticsGeneSnapshot}
\alias{FitKineticsGeneSnapshot}
\title{Compute the posterior distributions of RNA synthesis and degradation for a particular gene}
\usage{
FitKineticsGeneSnapshot(
  data,
  gene,
  columns = NULL,
  reference.columns = NULL,
  dispersion = NULL,
  slot = DefaultSlot(data),
  time.labeling = Design$dur.4sU,
  time.experiment = NULL,
  sample.f0.in.ss = TRUE,
  sample.level = 2,
  beta.prior = NULL,
  return.samples = FALSE,
  return.points = FALSE,
  N = 10000,
  N.max = N * 10,
  CI.size = 0.95,
  correct.labeling = FALSE
)
}
\arguments{
\item{data}{the grandR object}

\item{gene}{a gene name or symbol or index}

\item{columns}{samples or cell representing the same experimental condition (must refer to a unique labeling duration)}

\item{reference.columns}{a reference matrix usually generated by \link{FindReferences} to define reference samples for each sample (see details)}

\item{dispersion}{dispersion parameter for the given columns (if NULL, this is estimated from the data, takes a lot of time!)}

\item{slot}{the data slot to take f0 and totals from}

\item{time.labeling}{the column in the column annotation table denoting the labeling duration or the labeling duration itself}

\item{time.experiment}{the column in the column annotation table denoting the experimental time point (can be NULL, see details)}

\item{sample.f0.in.ss}{whether or not to sample f0 under steady state conditions}

\item{sample.level}{Define how the NTR is sampled from the hierarchical Bayesian model (must be 0,1, or 2; see details)}

\item{beta.prior}{The beta prior for the negative binomial used to sample counts, if NULL, a beta distribution is fit to all expression values and given dispersions}

\item{return.samples}{return the posterior samples of the parameters?}

\item{return.points}{return the point estimates per replicate as well?}

\item{N}{the posterior sample size}

\item{N.max}{the maximal number of posterior samples (necessary if old RNA > f0); if more are necessary, a warning is generated}

\item{CI.size}{A number between 0 and 1 representing the size of the credible interval}

\item{correct.labeling}{whether to correct labeling times}
}
\value{
a list containing the posterior mean of s and s, its credible intervals and,
if return.samples=TRUE a data frame containing all posterior samples
}
\description{
Compute the posterior distributions of RNA synthesis and degradation for a particular gene
}
\details{
The kinetic parameters s and d are computed using \link{TransformSnapshot}. For that, the sample either must be in steady state
(this is the case if defined in the reference.columns matrix), or if the levels of reference samples from a specific prior time point are known. This time point is
defined by \code{time.experiment} (i.e. the difference between the reference samples and samples themselves). If
\code{time.experiment} is NULL, then the labeling time of the samples is used (e.g. useful if labeling was started concomitantly with
the perturbation, and the reference samples are unperturbed samples).

By default, the hierarchical Bayesian model is estimated. If sample.level = 0, the NTRs are sampled from a beta distribution
that approximates the mixture of betas from the replicate samples. If sample.level = 1, only the first level from the hierarchical model
is sampled (corresponding to the uncertainty of estimating the biological variability). If sample.level = 2, the first and second levels
are estimated (corresponding to the full hierarchical model).

Columns can be given as a logical, integer or character vector representing a selection of the columns (samples or cells).
The expression is evaluated in an environment having the \code{\link{Coldata}}, i.e. you can use names of \code{\link{Coldata}} as variables to
conveniently build a logical vector (e.g., columns=Condition=="x").
}
\concept{snapshot}

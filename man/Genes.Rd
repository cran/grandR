% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grandR.R
\name{Genes}
\alias{Genes}
\alias{Columns}
\title{Gene and sample (or cell) names}
\usage{
Genes(data, genes = NULL, use.symbols = TRUE, regex = FALSE)

Columns(data, columns = NULL, reorder = FALSE)
}
\arguments{
\item{data}{A grandR object}

\item{genes}{which genes to use}

\item{use.symbols}{obtain the gene symbols instead of gene names}

\item{regex}{treat genes as a regex, and return all that match}

\item{columns}{which columns (i.e. samples or cells) to return (see details)}

\item{reorder}{if TRUE, do not enforce the current order of columns}
}
\value{
Either the gene or column names of the grandR data object, or the columns of an analysis table in the grandR object
}
\description{
Get the genes and sample (or cell) names for a grandR object, or add an additional gene annotation column
}
\details{
The genes are either the (often unreadable) gene ids (e.g. Ensembl ids), or the symbols.

\code{Genes(data,use.symbols=FALSE)} it the same as \code{rownames(data)}, and \code{Columns(data)} is the same as \code{colnames(data)}

If both column and value are specified for \code{GeneInfo}, a new column is added to the gene annotation table

Columns can be given as a logical, integer or character vector representing a selection of the columns (samples or cells).
The expression is evaluated in an environment having the \code{\link{Coldata}}, i.e. you can use names of \code{\link{Coldata}} as variables to
conveniently build a logical vector (e.g., columns=Condition=="x").
}
\examples{
sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                  design=c("Cell",Design$dur.4sU,Design$Replicate))

all(Genes(sars,use.symbols = FALSE)==rownames(sars))
all(Columns(sars)==colnames(sars))


}
\seealso{
\link{Coldata}, \link{GeneInfo}, \link{Analyses}
}
\concept{grandr}

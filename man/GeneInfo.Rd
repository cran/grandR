% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grandR.R
\name{GeneInfo}
\alias{GeneInfo}
\alias{GeneInfo<-}
\title{Get the gene annotation table or add additional columns to it}
\usage{
GeneInfo(data, column = NULL, value = NULL)

GeneInfo(data, column) <- value
}
\arguments{
\item{data}{A grandR object}

\item{column}{The name of the additional annotation column}

\item{value}{The additional annotation per gene}
}
\value{
Either the gene annotation table or a new grandR object having an updated gene annotation table
}
\description{
The gene annotation table contains meta information for the rows of a grandR object.
When loaded from the GRAND-SLAM output, this this contains gene ids, gene symbols, the
transcript length and the type.
}
\details{
New columns can be added either by \code{data<-GeneInfo(data,name,values)} or by \code{GeneInfo(data,name)<-values}.
}
\examples{
sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                  design=c("Cell",Design$dur.4sU,Design$Replicate))

head(GeneInfo(sars))
GeneInfo(sars,"LengthCategory")<-cut(GeneInfo(sars)$Length,c(0,1500,2500,Inf),
                                          labels=c("Short","Medium","Long"))
table(GeneInfo(sars)$LengthCategory)

}
\seealso{
\link{Genes}, \link{Coldata}, \link{ReadGRAND}
}
\concept{grandr}

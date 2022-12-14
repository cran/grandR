% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grandR.R
\name{GetAnalysisTable}
\alias{GetAnalysisTable}
\title{Obtain a table of analysis results values}
\usage{
GetAnalysisTable(
  data,
  analyses = NULL,
  regex = TRUE,
  columns = NULL,
  genes = Genes(data),
  by.rows = FALSE,
  gene.info = TRUE,
  name.by = "Symbol",
  prefix.by.analysis = TRUE
)
}
\arguments{
\item{data}{A grandR object}

\item{analyses}{One or several regex to be matched against analysis names (\link{Analyses}); all analysis tables if NULL}

\item{regex}{Use regex for analyses (TRUE) or don't (FALSE, i.e. must specify the exact name)}

\item{columns}{Regular expressions to select columns from the analysis table (all have to match!); all columns if NULL}

\item{genes}{Restrict the output table to the given genes}

\item{by.rows}{if TRUE, add rows if there are multiple analyses; otherwise, additional columns are appended; TRUE also sets prefix.by.analysis to FALSE!}

\item{gene.info}{Should the table contain the \link{GeneInfo} values as well (at the beginning)?}

\item{name.by}{A column name of \link{Coldata}(data). This is used as the rownames of the output table}

\item{prefix.by.analysis}{Should the column names in the output prefixed by the analysis name?}
}
\value{
A data frame containing the analysis results
}
\description{
This is the main function to access analysis results. For slot data, use \code{\link{GetTable}} (as a large matrix)
or \code{\link{GetData}} (as tidy table).
}
\details{
The names for the output table are <Analysis name>.<columns name>
}
\examples{
sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                  design=c("Condition",Design$dur.4sU,Design$Replicate))
sars<-LFC(sars,contrasts=GetContrasts(sars,group = "duration.4sU"))
head(GetAnalysisTable(sars,columns="LFC"))

}
\seealso{
\link{GetTable},\link{GetData},\link{Genes}
}
\concept{data}

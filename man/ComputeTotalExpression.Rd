% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing.R
\name{ComputeTotalExpression}
\alias{ComputeTotalExpression}
\title{Total expression computation}
\usage{
ComputeTotalExpression(
  data,
  name,
  genes = Genes(data),
  mode.slot = DefaultSlot(data)
)
}
\arguments{
\item{data}{the grandR object}

\item{name}{the new name by which this is added to the Coldata}

\item{genes}{define the set of genes to compute the percentage for}

\item{mode.slot}{which mode.slot to take the values for computing the percentage from}
}
\value{
a new grandR object having the total expression in its Coldata table
}
\description{
Compute the total expression for a particular set of genes.
}
\details{
Genes can be referred to by their names, symbols, row numbers in the gene table, or a logical vector referring to the gene table rows.

To refer to data slots, the mode.slot syntax can be used: Each name is either a data slot, or one of (new,old,total)
followed by a dot followed by a slot. For new or old, the data slot value is multiplied by ntr or 1-ntr. This can be used e.g. to filter by \emph{new counts}.
}
\seealso{
\code{\link{Coldata}}
}
\concept{data}

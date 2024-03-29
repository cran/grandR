% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load.R
\name{ReadGRAND}
\alias{ReadGRAND}
\title{Read the output of GRAND-SLAM 2.0 into a grandR object.}
\usage{
ReadGRAND(
  prefix,
  design = c(Design$Condition, Design$Replicate),
  classify.genes = ClassifyGenes(),
  read.percent.conv = FALSE,
  read.min2 = FALSE,
  rename.sample = NULL,
  verbose = FALSE
)
}
\arguments{
\item{prefix}{Can either be the prefix used to call GRAND-SLAM with, or the main output file ($prefix.tsv.gz);
if the RCurl package is installed, this can also be a URL}

\item{design}{Either a design vector (see details), or a data.frame providing metadata for all columns (samples/cells),
or a function that is called with the condition name vector and is supposed to return this data.frame.}

\item{classify.genes}{A function that is used to add the \emph{type} column to the gene annotation table, always a call to \link{ClassifyGenes}}

\item{read.percent.conv}{Should the percentage of conversions also be read?}

\item{read.min2}{Should the read count with at least 2 mismatches also be read?}

\item{rename.sample}{function that is applied to each sample name before parsing (or NULL)}

\item{verbose}{Print status updates}
}
\value{
A grandR object containing the read counts, NTRs, information on the NTR posterior distribution (alpha,beta)
and potentially additional information of all genes detected by GRAND-SLAM
}
\description{
Metabolic labeling - nucleotide conversion RNA-seq data (such as generated by SLAM-seq,TimeLapse-seq or TUC-seq)
must be carefully analyzed to remove bias due to incomplete labeling. GRAND-SLAM is a software package that
employs a binomial mixture modeling approach to obtain precise estimates of the new-to-total RNA ratio (NTR) per gene and sample (or cell).
This function directly reads the output of GRAND-SLAM 2.0 into a grandR object.
}
\details{
If columns (samples/cells) are named systematically in a particular way, the design vector provides
a powerful and easy way to create the column annotations.

The column names have to contain dots (.) to separate the fields for the column annotation table.
E.g. the name \emph{Mock.4h.A} will be split into the fields \emph{Mock}, \emph{4h} and  \emph{A}.
For such names, a design vector of length 3 has to be given, that describes the meaning of each field.
A reasonable design vector for the example would be \code{c("Treatment","Time","Replicate")}.
Some names are predefined in the list \link{Design}.

The names given in the design vector might even have additional semantics:
E.g. for the name \emph{duration.4sU} the values are interpreted (e.g. 4h is converted into the number 4,
or 30min into 0.5, or no4sU into 0). Semantics can be user-defined by calling \code{\link{MakeColdata}}
and using the return value as the design parameter, or a function that calls MakeColdata.
In most cases it is easier to manipulate the \code{\link{Coldata}} table after loading data instead of using this mechanism;
the build-in semantics simply provide a convenient way to reduce this kind of manipulation in most cases.

Sometimes you might have forgotten to name all samples consistently (or you simply messed something up).
In this case, the rename.sample parameter can be handy (e.g. to rename a particular misnamed sample).
}
\examples{
\donttest{
sars <- ReadGRAND("https://zenodo.org/record/5834034/files/sars.tsv.gz",
                      design=c("Cell",Design$dur.4sU,Design$Replicate), verbose=TRUE)
}

}
\seealso{
\link{ReadGRAND3},\link{ClassifyGenes},\link{MakeColdata},\link{DesignSemantics}
}
\concept{load}

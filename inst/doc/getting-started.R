## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment=NA,R.options=list(width = 95))

## ----warning=FALSE---------------------------------------------------------------------------
suppressPackageStartupMessages({
    library(grandR)
    library(ggplot2)
    library(patchwork)
})
data <- ReadGRAND("https://zenodo.org/record/6976391/files/BANP.tsv.gz",
                  design=c("Cell","Experimental.time","Genotype",Design$dur.4sU,Design$has.4sU,Design$Replicate))

## --------------------------------------------------------------------------------------------
data <- FilterGenes(data)

## --------------------------------------------------------------------------------------------
Condition(data) <- c("Genotype","Experimental.time.original","has.4sU")
PlotPCA(data)

## --------------------------------------------------------------------------------------------
# differential expression, see differential expression vignette
contrasts <- GetContrasts(data,contrast=c("Experimental.time.original","0h"),columns = Genotype=='dTag')
data <- LFC(data,name.prefix = "total",contrasts = contrasts)
data <- PairwiseDESeq2(data,name.prefix = "total",contrasts = contrasts)
data <- LFC(data,name.prefix = "new",contrasts = contrasts,mode="new", normalization = "total")
data <- PairwiseDESeq2(data,name.prefix = "new",contrasts = contrasts,mode="new", normalization = "total")

## ----fig.height=3, fig.width=6, warning=FALSE------------------------------------------------
MAPlot(data,analysis = "total.4h vs 0h")|
  MAPlot(data,analysis = "new.4h vs 0h")

## --------------------------------------------------------------------------------------------
genes <- GetSignificantGenes(data,analysis = "new.4h vs 0h", criteria = Q<0.05 & LFC< -1)
GetAnalysisTable(data,analyses = "4h vs 0h",genes = genes, columns = "LFC|Q", gene.info = FALSE)


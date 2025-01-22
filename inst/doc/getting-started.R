## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment=NA,R.options=list(width = 95))

## ----warning=FALSE---------------------------------------------------------------------------
suppressPackageStartupMessages({
    library(grandR)
    library(ggplot2)
    library(patchwork)
})

sars <- ReadGRAND(system.file("extdata", "sars.tsv.gz", package = "grandR"),
                 design=c(Design$Condition,Design$dur.4sU,Design$Replicate))
sars <- Normalize(sars)
sars

## ----fig.alt = "Progressive labeling plot for SRSF6"-----------------------------------------
PlotGeneProgressiveTimecourse(sars,"SRSF6",steady.state=list(Mock=TRUE,SARS=FALSE))

## --------------------------------------------------------------------------------------------
SetParallel(cores = 2)  # increase on your system, or omit the cores = 2 for automatic detection
sars<-FitKinetics(sars,"kinetics",steady.state=list(Mock=TRUE,SARS=FALSE))

## ----fig.height=3, fig.width=6, warning=FALSE------------------------------------------------
Analyses(sars)

## --------------------------------------------------------------------------------------------
head(GetAnalysisTable(sars))

## ----fig.height=4, fig.width=4, fig.alt = "Half-lives scatter plot mock vs SARS"-------------
PlotScatter(sars,`kinetics.Mock.Half-life`,`kinetics.SARS.Half-life`,
            lim=c(0,24),correlation = FormatCorrelation())+
  geom_abline()


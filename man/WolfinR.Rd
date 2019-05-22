\name{WolfinR}
\alias{WolfinR}
\title{Simple command for running Wolframscript from R.}
\usage{
WolfinR(cmd, graphics=FALSE)
}
\description{
If graphics = TRUE, the output will be showed in the plot panel of RStudio.
}
\examples{
WolfinR("Plot[Sin[x],{x,0,2 Pi}]", graphics=TRUE)
}

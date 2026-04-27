\name{triangdist}
\alias{triangdist}
\alias{dtriang}
\alias{ptriang}
\alias{qtriang}
\alias{rtriang}
\title{Triangular distribution}
\usage{
dtriang(x, min, max, mode)

ptriang(q, min, max, mode)

qtriang(p, min, max, mode)

rtriang(n, min, max, mode)
}
\arguments{
\item{x, q}{Numeric vector of quantiles.}
\item{p}{Numeric vector of probabilities.}
\item{n}{Number of observations.}
\item{min}{Numeric vector giving the lower bound.}
\item{max}{Numeric vector giving the upper bound.}
\item{mode}{Numeric vector giving the mode.}
}
\value{
\code{dtriang()} gives the density, \code{ptriang()} gives the distribution
function, \code{qtriang()} gives the quantile function, and \code{rtriang()}
generates random values.
}
\description{
Density, distribution, quantile, and random generation functions for the
triangular distribution.
}
\examples{
dtriang(5, min = 0, max = 10, mode = 5)
ptriang(5, min = 0, max = 10, mode = 5)
qtriang(0.5, min = 0, max = 10, mode = 5)
rtriang(5, min = 0, max = 10, mode = 5)
}

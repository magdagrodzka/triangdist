# triangdist

This package implements the triangular distribution in R.

The triangular distribution is defined by three parameters:
- min: lower bound
- max: upper bound
- mode: most likely value (must be between min and max)

## Installation

You can install the package from GitHub using:

remotes::install_github("magdagrodzka/triangdist")

## Functions

The package provides the following functions:
- dtriang() – density function  
- ptriang() – distribution function  
- qtriang() – quantile function  
- rtriang() – random number generation  

These follow the same structure as standard R functions like dnorm, pnorm, etc.

## Example

library(triangdist)

dtriang(5, min = 0, max = 10, mode = 5)  
ptriang(5, min = 0, max = 10, mode = 5)  
qtriang(0.5, min = 0, max = 10, mode = 5)  
rtriang(10, min = 0, max = 10, mode = 5)

## Notes

- Functions support vectorized inputs  
- Inputs are validated (e.g. min < max, mode within range)  
- The package was checked with devtools::check()

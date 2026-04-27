# triangdist

This package implements the triangular distribution in R.

The triangular distribution uses three parameters:

- `min`: lower bound
- `max`: upper bound
- `mode`: most likely value

The mode must be between `min` and `max`.

## Installation

Install the package from GitHub with:

```r
remotes::install_github("magdagrodzka/triangdist")
```

## Functions

The package includes four functions:

- `dtriang()` for the density
- `ptriang()` for the distribution function
- `qtriang()` for quantiles
- `rtriang()` for random values

They are written to work like the usual R distribution functions, for example
`dnorm()`, `pnorm()`, `qnorm()`, and `rnorm()`.

## Example

```r
library(triangdist)

dtriang(5, min = 0, max = 10, mode = 5)
ptriang(5, min = 0, max = 10, mode = 5)
qtriang(0.5, min = 0, max = 10, mode = 5)
rtriang(10, min = 0, max = 10, mode = 5)
```

## Checks

Before submission, run:

```r
devtools::check()
covr::report()
lintr::lint_package()
```

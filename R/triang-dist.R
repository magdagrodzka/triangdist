#' Triangular distribution
#'
#' Density, distribution, quantile, and random generation functions for the
#' triangular distribution.
#'
#' @param x,q Numeric vector of quantiles.
#' @param p Numeric vector of probabilities.
#' @param n Number of observations.
#' @param min Numeric vector giving the lower bound.
#' @param max Numeric vector giving the upper bound.
#' @param mode Numeric vector giving the mode.
#'
#' @return
#' `dtriang()` gives the density, `ptriang()` gives the distribution function,
#' `qtriang()` gives the quantile function, and `rtriang()` generates random
#' values.
#'
#' @examples
#' dtriang(5, min = 0, max = 10, mode = 5)
#' ptriang(5, min = 0, max = 10, mode = 5)
#' qtriang(0.5, min = 0, max = 10, mode = 5)
#' rtriang(5, min = 0, max = 10, mode = 5)
#'
#' @name triangdist
NULL

#' @rdname triangdist
#' @export
dtriang <- function(x, min, max, mode) {
  args <- recycle_triangular_args(x, min, max, mode)
  x <- args[[1]]
  min <- args[[2]]
  max <- args[[3]]
  mode <- args[[4]]

  check_triangular_params(min, max, mode)

  out <- numeric(length(x))
  left <- x >= min & x <= mode
  right <- x > mode & x <= max

  out[left] <- 2 * (x[left] - min[left]) /
    ((max[left] - min[left]) * (mode[left] - min[left]))

  out[right] <- 2 * (max[right] - x[right]) /
    ((max[right] - min[right]) * (max[right] - mode[right]))

  mode_at_min <- mode == min & x == min
  mode_at_max <- mode == max & x == max

  out[mode_at_min] <- 2 / (max[mode_at_min] - min[mode_at_min])
  out[mode_at_max] <- 2 / (max[mode_at_max] - min[mode_at_max])
  out
}

#' @rdname triangdist
#' @export
ptriang <- function(q, min, max, mode) {
  args <- recycle_triangular_args(q, min, max, mode)
  q <- args[[1]]
  min <- args[[2]]
  max <- args[[3]]
  mode <- args[[4]]

  check_triangular_params(min, max, mode)

  out <- numeric(length(q))
  out[q >= max] <- 1

  left <- q > min & q <= mode
  right <- q > mode & q < max

  out[left] <- (q[left] - min[left])^2 /
    ((max[left] - min[left]) * (mode[left] - min[left]))

  out[right] <- 1 - (max[right] - q[right])^2 /
    ((max[right] - min[right]) * (max[right] - mode[right]))

  mode_at_min <- mode == min & q > min & q < max
  mode_at_max <- mode == max & q > min & q < max

  out[mode_at_min] <- 1 - (max[mode_at_min] - q[mode_at_min])^2 /
    (max[mode_at_min] - min[mode_at_min])^2

  out[mode_at_max] <- (q[mode_at_max] - min[mode_at_max])^2 /
    (max[mode_at_max] - min[mode_at_max])^2
  out
}

#' @rdname triangdist
#' @export
qtriang <- function(p, min, max, mode) {
  args <- recycle_triangular_args(p, min, max, mode)
  p <- args[[1]]
  min <- args[[2]]
  max <- args[[3]]
  mode <- args[[4]]

  check_triangular_params(min, max, mode)

  if (any(is.na(p) | p < 0 | p > 1)) {
    stop("`p` must contain values between 0 and 1.", call. = FALSE)
  }

  fc <- (mode - min) / (max - min)
  out <- numeric(length(p))
  left <- p <= fc
  right <- p > fc

  out[left] <- min[left] +
    sqrt(p[left] * (max[left] - min[left]) * (mode[left] - min[left]))

  out[right] <- max[right] -
    sqrt((1 - p[right]) * (max[right] - min[right]) *
      (max[right] - mode[right]))

  mode_at_min <- mode == min
  mode_at_max <- mode == max

  out[mode_at_min] <- max[mode_at_min] -
    (max[mode_at_min] - min[mode_at_min]) * sqrt(1 - p[mode_at_min])

  out[mode_at_max] <- min[mode_at_max] +
    (max[mode_at_max] - min[mode_at_max]) * sqrt(p[mode_at_max])
  out
}

#' @rdname triangdist
#' @export
rtriang <- function(n, min, max, mode) {
  if (length(n) != 1 || is.na(n) || n < 0) {
    stop("`n` must be a single non-negative number.", call. = FALSE)
  }

  qtriang(runif(as.integer(n)), min = min, max = max, mode = mode)
}

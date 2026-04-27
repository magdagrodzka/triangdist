recycle_triangular_args <- function(...) {
  args <- list(...)
  lengths <- vapply(args, length, integer(1))
  n <- max(lengths)

  bad <- lengths != 0 & n %% lengths != 0
  if (any(bad)) {
    warning("longer object length is not a multiple of shorter object length")
  }

  lapply(args, rep, length.out = n)
}

check_triangular_params <- function(min, max, mode) {
  invalid <- is.na(min) | is.na(max) | is.na(mode) |
    min >= max | mode < min | mode > max

  if (any(invalid)) {
    stop(
      "`min` must be less than `max`, and `mode` must be in [min, max].",
      call. = FALSE
    )
  }
}

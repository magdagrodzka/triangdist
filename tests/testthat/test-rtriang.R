test_that("random generation returns values in the expected range", {
  set.seed(1)
  x <- rtriang(100, 0, 10, 5)

  expect_length(x, 100)
  expect_true(all(x >= 0))
  expect_true(all(x <= 10))
})

test_that("random generation validates n", {
  expect_error(rtriang(-1, 0, 10, 5), "n")
  expect_error(rtriang(NA, 0, 10, 5), "n")
})

test_that("rtriang generates valid values", {
  set.seed(123)
  samp <- rtriang(1000, 0, 1, 0.5)
  expect_true(all(samp >= 0 & samp <= 1))
  expect_length(samp, 1000)
})

test_that("rtriang handles vectorized parameters", {
  set.seed(123)
  samp <- rtriang(10, min = c(0,0), max = c(1,2), mode = c(0.5,1))
  expect_length(samp, 10)
  expect_true(all(!is.na(samp)))
})

test_that("rtriang works with mode at boundaries", {
  set.seed(123)
  samp1 <- rtriang(100, 0, 1, 0)
  samp2 <- rtriang(100, 0, 1, 1)
  expect_true(all(samp1 >= 0 & samp1 <= 1))
  expect_true(all(samp2 >= 0 & samp2 <= 1))
})

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

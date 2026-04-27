test_that("quantile function is correct", {
  expect_equal(qtriang(0, 0, 10, 5), 0)
  expect_equal(qtriang(0.5, 0, 10, 5), 5)
  expect_equal(qtriang(1, 0, 10, 5), 10)
})

test_that("quantile handles boundary modes", {
  expect_equal(qtriang(0.75, 0, 10, 0), 5)
  expect_equal(qtriang(0.25, 0, 10, 10), 5)
})

test_that("quantile validates probabilities", {
  expect_error(qtriang(-0.1, 0, 10, 5), "between 0 and 1")
  expect_error(qtriang(1.1, 0, 10, 5), "between 0 and 1")
})

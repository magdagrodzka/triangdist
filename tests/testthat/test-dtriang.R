test_that("density is correct", {
  expect_equal(dtriang(0, 0, 10, 5), 0)
  expect_equal(dtriang(5, 0, 10, 5), 0.2)
  expect_equal(dtriang(10, 0, 10, 5), 0)
  expect_equal(dtriang(c(-1, 11), 0, 10, 5), c(0, 0))
})

test_that("density handles boundary modes", {
  expect_equal(dtriang(0, 0, 10, 0), 0.2)
  expect_equal(dtriang(10, 0, 10, 10), 0.2)
})

test_that("density validates parameters", {
  expect_error(dtriang(1, 1, 1, 1), "min")
  expect_error(dtriang(1, 0, 1, 2), "mode")
})

test_that("recycling warning is triggered", {
  expect_warning(
    dtriang(c(1, 2), min = c(0, 0, 0), max = 10, mode = 5)
  )
})
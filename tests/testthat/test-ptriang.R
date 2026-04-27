test_that("distribution function is correct", {
  expect_equal(ptriang(0, 0, 10, 5), 0)
  expect_equal(ptriang(5, 0, 10, 5), 0.5)
  expect_equal(ptriang(10, 0, 10, 5), 1)
  expect_equal(ptriang(c(-1, 11), 0, 10, 5), c(0, 1))
})

test_that("distribution handles boundary modes", {
  expect_equal(ptriang(5, 0, 10, 0), 0.75)
  expect_equal(ptriang(5, 0, 10, 10), 0.25)
})

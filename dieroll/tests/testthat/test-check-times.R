source('~/Desktop/hw-stat133/hw-05/dieroll/R/roll.R')
library("dieroll")

context("check times")

test_that("test times",{
  x=-1
  y <- "\nargument 'times' must be a positive integer"
  expect_error(check_times(x),y)
})


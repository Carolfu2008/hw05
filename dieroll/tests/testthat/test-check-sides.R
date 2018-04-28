source('~/Desktop/hw-stat133/hw-05/dieroll/R/die.R')
library("dieroll")

context("check sides")

test_that("test sides",{
  x=1:5
  y <- "\n'sides' must be a vector of length 6"
  expect_error(check_sides(x),y)
})

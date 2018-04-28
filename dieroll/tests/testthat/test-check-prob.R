source('~/Desktop/hw-stat133/hw-05/dieroll/R/die.R')
library("dieroll")
context("check probability")

test_that("test prob",{
  x=c(0.2,0.4,0.1,0.3,0.1,0.1)
  y <- "\nelements in 'prob' must add up to 1"
  expect_error(check_prob(x),y)
})

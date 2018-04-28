source('~/Desktop/hw-stat133/hw-05/dieroll/R/die.R')
library("dieroll")

context("test for die")

test_that("test die",{
  expect_length(die(), 2)
  expect_is(die(),"die")

})


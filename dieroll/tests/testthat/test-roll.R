source('~/Desktop/hw-stat133/hw-05/dieroll/R/roll.R')
library("dieroll")

context("check function roll")

test_that("test roll",{
  fair_die=die()
x=roll(fair_die,times=1)
  expect_length(roll(x),4)
  expect_is(roll(x),"roll")
})

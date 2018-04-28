#' @title Plot of object die
#' @description Plots the relative frequencies of a series of rolls
#' @param x an object of class \code{"die"}
#' @param side number indicating which side of die to consider
#' @param \dots arguments to be passed to/from other methods
#' @export
#' @examples
#'  \dontrun{
#'  # create a die and toss it 100 times
#'  die1 <- die()
#'  roll1000 <- roll(die1, times = 1000)
#'
#'  plot(roll1000)
#'  }
plot.roll <- function(x) {
  
  firSide <- sum(x$rolls==1)
  secSide <- sum(x$rolls==2)
  thrSide <- sum(x$rolls==3)
  fouSide <- sum(x$rolls==4)
  fivSide <- sum(x$rolls==5)
  sixSide <- sum(x$rolls==6)
  allSide <-c(firSide, secSide, thrSide, fouSide, fivSide, sixSide) 
  firProb <- firSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  secProb <- secSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  thrProb <- thrSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  fouProb <- fouSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  fivProb <- fivSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  sixProb <- sixSide/sum(firSide+secSide+thrSide+fouSide+fivSide+sixSide)
  allProb<-c(firProb, secProb, thrProb, fouProb, fivProb, sixProb) 
  
  barplot(allProb, names.arg = x$sides, las=1,main = paste("Frequencies in a series of ",length(x$rolls),"die rolls"), xlab = "sides of die", ylab = "relative frequencies",border = FALSE)
}




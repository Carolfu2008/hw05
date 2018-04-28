#' @title roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of coin \code{"sides"}}
#' @return \item{prob}{vector of coin \code{"prob"}}
#' @return \item{total}{total number of tosses}
#' @return \item{1}{number of side 1} #{heads}{number of heads}
#' @return \item{2}{number of side 2}
#' @return \item{3}{number of side 3}
#' @return \item{4}{number of side 4}
#' @return \item{5}{number of side 5}
#' @return \item{6}{number of side 6}
#' @export
#' @examples
#' \dontrun{die1 <- die()
#'
#' # roll a die 10 times
#' die10 <- roll(die1, times = 10)}
#' \dontrun{
#'
#' # add 5 more rolls
#' roll15 <- roll10 + 5}
roll <- function(x,...) UseMethod("roll")
roll <- function(x, times = 1){
  check_times(times)
  rolls <- sample(x$sides, size = times, replace = TRUE, prob=x$prob)
  myroll <- list(rolls=rolls, sides=x$sides,prob=x$prob,total=times)
  class(myroll) <- "roll"

  return(myroll)
}

# private function to check vector of 'times'
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}
# private function to print reslut of 'roll' Function
print.roll <- function(x){
  cat("object 'roll'\n\n")
  cat("$rolls\n\n")
  roll <- x$rolls
  print(roll)
  invisible(roll)
}

#' @export
summary.roll <- function(x){
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

  freqs <- data.frame(side=x$sides, count=allSide, prob=allProb)
  obj <- list(freqs = freqs)
  class(obj) <- "summary.roll"
  return(obj)
}


#' @export
print.summary.roll <- function(x){
  cat("summary 'roll'\n\n")
  #freqs <- data.frame(side=x$sides, count=x$count, prob=x$prob)
  print(x$freqs)
  invisible(x)
}


#' @export
"[<-.roll" <- function(x, i, value) {
  x$rolls[i] <- value
  myroll <- list(rolls=x$rolls, sides=x$sides,prob=x$prob,total=x$times)
  class(myroll) <- "roll"

  return(myroll)
}


#' @export
"[.roll" <- function(x,i) {
  x$rolls[i]
}


#' @export
"+.roll" <- function(x, incr){

  times = x$total+incr
  rolls <- sample(x$sides, size = times, replace = TRUE, prob=x$prob)
  myroll <- list(rolls=rolls, sides=x$sides,prob=x$prob,total=times)

  myroll
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}

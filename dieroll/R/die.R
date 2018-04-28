#' @title die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"die"}
#' @seealso \code{\link{roll}}
#' @export
#' @examples
#' \dontrun{
#' # default
#' die1 <- die()}
#'\dontrun{
#' # another die
#' die2 <- die(c('a', 'b','c','d','e','f'))
#'}
die <- function(sides=1:6, prob=rep(1/6,6)){
  check_prob(prob)
  check_sides(sides)
  dieObject <- list(sides = sides, prob = prob)
  class(dieObject) <- "die"
  dieObject
}

# private function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'sides' must be a vector of length 6")
  }
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}


# private function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}

#' @export
print.die <- function(x, ...){
  cat('object "die"\n\n')
  die <- data.frame(side = x$sides, prob = x$prob)
  print(die)

  invisible(x)
}

#' @rdname die
#' @param x an R object
#' @export
#' @examples

#' is.die (die)
is.die <- function(x) {
  is(x, "die")
}

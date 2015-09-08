#' unit & arrow functions from grid.
#'
#' See \code{\link[grid]{arrow}} and \code{\link[grid]{unit}} for more details.
#' These functions are re-exported from grid by ggplot2 since they are
#' so commonly used.
#'
#' @name ggplot2-grid
#' @export unit arrow
#' @aliases unit arrow
#' @keywords internal
NULL

#' Name ggplot grid object
#'
#' Convenience function to name grid objects
#'
#' @param prefix New name for \code{grob}.
#' @param grob A grob to name.
#' @export
#' @keywords internal
ggname <- function(prefix, grob) {
  grob$name <- grobName(grob, prefix)
  grob
}

width_cm <- function(x) {
  if (is.grob(x)) {
    convertWidth(grobWidth(x), "cm", TRUE)
  } else if (is.list(x)) {
    vapply(x, width_cm, numeric(1))
  } else if (is.unit(x)) {
    convertWidth(x, "cm", TRUE)
  } else {
    stop("Unknown input")
  }
}
height_cm <- function(x) {
  if (is.grob(x)) {
    convertWidth(grobHeight(x), "cm", TRUE)
  } else if (is.list(x)) {
    vapply(x, height_cm, numeric(1))
  } else if (is.unit(x)) {
    convertHeight(x, "cm", TRUE)
  } else {
    stop("Unknown input")
  }
}

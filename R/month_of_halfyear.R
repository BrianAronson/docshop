#' Find month of half-year
#' @export

month_of_halfyear = function(hy, order) {
  return(6 * (hy - 1) + order)
}
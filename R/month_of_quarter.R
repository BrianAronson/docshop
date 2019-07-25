#' Find month of quarter
#' @export

month_of_quarter = function(qq, order) {
  return(3 * (qq - 1) + order)
}
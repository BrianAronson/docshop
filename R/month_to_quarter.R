#' Convert month to quarter
#' @export

month_to_quarter = function(mm) {
  q = (mm - 1) %/% 3 + 1
  return(q)
}

#' Convert quarter to half-year
#' @export

quarter_to_halfyear = function(quarter) {
  ((quarter - 1) %/% 2) + 1
}
#' Determine how many quarters elapsed between time period(?)
#' @export

elapsed_quarter_from_origin = function(
  yy,
  qq,
  reference_year = 2007,
  reference_quarter = 1
){
    (yy - reference_year) * 4 + (qq - reference_quarter)
 }

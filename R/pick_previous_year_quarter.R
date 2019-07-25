#' Find quarter of prior time point based on desired lag
#' @export

pick_previous_year_quarter = function(year, quarter, lag) {
  lag_year = year + (quarter - lag) %/% 4
  lag_quarter = ((quarter - lag - 1) %% 4) + 1
  return(list(year = lag_year, quarter = lag_quarter))
}
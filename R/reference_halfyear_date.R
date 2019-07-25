#' Find input date based on year and half-yeard data
#' @export

reference_halfyear_date = function(outfile) {
  yy = extract_year_halfyear_from_filename(outfile)$year
  hy = extract_year_halfyear_from_filename(outfile)$halfyear
  halfyear_first_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 1), "-01"))
  if (hy == 1) {
    halfyear_last_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 6), "-30"))
  } else {
    halfyear_last_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 6), "-31"))
  }
  return(c(halfyear_first_date, halfyear_last_date))
}
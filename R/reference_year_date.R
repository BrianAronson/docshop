#' Create dates based on year info
#' @export

reference_year_date = function(outfile) {
  yy = extract_year_from_filename(outfile)
  year_first_date = as.Date(paste0(yy, "-", "01", "-01"))
  year_last_date = as.Date(paste0(yy, "-", "12", "-31"))
  return(c(year_first_date, year_last_date))
}
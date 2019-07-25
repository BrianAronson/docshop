#' Create dates from year/quarter info
#' @export

reference_quarter_date = function(outfile) {
  yy = extract_year_quarter_from_filename(outfile)$year
  qq = extract_year_quarter_from_filename(outfile)$quarter
  quarter_first_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 1), "-01"))
  if (qq == 1 | qq == 4) {
    quarter_last_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 3), "-31"))
  } else {
    quarter_last_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 3), "-30"))
  }
  return(c(quarter_first_date, quarter_last_date))
}
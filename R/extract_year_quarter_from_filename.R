#' Extract year and quarter from filename
#' @export

extract_year_quarter_from_filename = function(outfile) {
  year_quarter = str_extract(outfile, "\\d{4}q\\d{1}")
  yy = as.integer(unlist(strsplit(year_quarter, "q"))[1])
  qq = as.integer(unlist(strsplit(year_quarter, "q"))[2])
  return(list(
    year_quarter = year_quarter,
    year = yy,
    quarter = qq
  ))
}
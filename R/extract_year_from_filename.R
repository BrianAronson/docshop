#' Extracts year from filename
#' @export

extract_year_from_filename = function(outfile) {
  year = as.integer(str_extract(outfile, "\\d{4}"))
  return(year)
}
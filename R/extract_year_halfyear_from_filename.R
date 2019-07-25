#' Extract year and half-year from filename
#' @export

extract_year_halfyear_from_filename = function(outfile) {
  year_halfyear = str_extract(outfile, "\\d{4}h\\d{1}")
  yy = as.integer(unlist(strsplit(year_halfyear, "h"))[1])
  hy = as.integer(unlist(strsplit(year_halfyear, "h"))[2])
  return(list(
    year_halfyear = year_halfyear,
    year = yy,
    halfyear = hy
  ))
  
}
#' Extracts direction from file
#' @export

extract_direction_from_file = function(outfile) {
  direction = ifelse(!is.na(str_extract(outfile, "from_zip")), "from", "to")
  return(direction)
}
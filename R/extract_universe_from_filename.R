#' Extracts universe from filename
#' @export

extract_universe_from_filename = function(outfile) {
  outfile = unlist(strsplit(outfile, "/"))
  universe = c("RS", "ZIP5", "SES", "DOD")
  universe_file = universe[unlist(lapply(universe, function(x)
    length(grep(x, outfile)))) == 1]
  return(universe_file)
}
#' Extracts community type from file
#' @export

extract_ctype_from_file = function(infile) {
  ctype = na.omit(str_extract(infile, community_type_list))
  return(ctype)
}
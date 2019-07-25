#' Extracts datatype from filename
#' @export

extract_datatype_from_filename = function(outfile) {
  outfile = unlist(strsplit(outfile, "_"))
  outfile = outfile[[grep("\\d{4}|\\d{4}q{1}|\\d{4}h{1}", outfile)]]
  datatype = gsub("\\d{4}|\\d{4}q{1}|\\d{4}h{1}", "", outfile)
  return(datatype)
}
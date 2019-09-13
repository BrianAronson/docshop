#' Save object to Amazon S3 in .fst format
#' @description Writes objects to Amazon S3 in fst format.
#' @param data Data to save
#' @param object File name to save as
#' @param compress Degree of file compression
#' @keywords write S3
#' @export
#' @examples
#' s3write_fst(
#'   list_mdata,
#'   object = paste0("s3://iuni-doctorshopping/derived_R/edgelist/","edgelist_all",".fst"),
#'   compress=100
#' )

s3write_fst = function(data,object,compress=100){
  if (str_detect(object,'s3://')){
    tmp = tmp_generate('.fst')
    write_fst(data,path=tmp,compress=compress)
    bucket <- get_bucketname(object)
    object <- gsub(paste0("s3://",bucket,"/"),"",object)
    s3HTTP(verb = "PUT", 
           bucket = bucket,
           path = paste0('/', object),
           request_body = tmp,
           verbose = FALSE,
           show_progress = TRUE)
    file.remove(tmp)
    invisible(gc())
  } else {
    dir.create(dirname(object), recursive= TRUE,showWarnings = FALSE)
    write_fst(data,path=object,compress=compress)
  }
}
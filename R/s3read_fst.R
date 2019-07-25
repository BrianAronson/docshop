#' Reads fst objects from S3
#' @export

s3read_fst = function(object, aws = TRUE, ...) {
  if (str_detect(object, 's3://')) {
    tmp = tmp_generate('.fst')
    bucket <- get_bucketname(object)
    save_object(bucket = bucket,
                object = object,
                file = tmp)
    data = read_fst(tmp, as.data.table = TRUE, ...)
    file.remove(tmp)
    invisible(gc())
  } else {
    data = read_fst(object, as.data.table = TRUE, ...)
  }
  return(data)
}
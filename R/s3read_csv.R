#' Reads .csv objects from S3
#' @export

s3read_csv = function(object,fread = TRUE,aws = TRUE,...) {
  if (str_detect(object, 's3://')) {
    bucket <- get_bucketname(object)
    if (fread == TRUE) {
      tmp = tmp_generate('.csv')
      save_object(bucket = bucket,
                  object = object,
                  file = tmp)
      data = fread(tmp, ...)
      file.remove(tmp)
      invisible(gc())
    } else {
      data = read_csv(s3connection(object), ...)
    }
  } else {
    if (fread == TRUE) {
      data = fread(object, ...)
    } else {
      data = read_csv(object, ...)
    }
  }
  return(data)
}

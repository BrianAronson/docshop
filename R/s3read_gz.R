#' Reads .csv.gz objects from S3
#' @export

s3read_gz = function(object, aws = TRUE) {
  if (str_detect(object, 's3://')) {
    tmp = tmp_generate('.csv.gz')
    bucket <- get_bucketname(object)
    save_object(bucket = bucket,
                object = object,
                file = tmp)
    data = fread(tmp)
    file.remove(tmp)
    invisible(gc())
  } else {
    data = fread(object)
  }
  return(data)
}
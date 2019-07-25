#' Writes object in csv.gz format to S3
#' @export

s3write_gz = function(data, object, aws = TRUE) {
  if (str_detect(object, 's3://')) {
    tmp = tmp_generate('.csv')
    fwrite(data, tmp)
    R.utils::gzip(tmp,
                  paste0(tmp, ".gz"),
                  overwrite = TRUE,
                  remove = TRUE)
    put_object(file = paste0(tmp, ".gz"), object = object)
    file.remove(paste0(tmp, ".gz"))
    invisible(gc())
  } else {
    fwrite(data, object)
    R.utils::gzip(object,
                  paste0(object, ".gz"),
                  overwrite = TRUE,
                  remove = TRUE)
  }
}
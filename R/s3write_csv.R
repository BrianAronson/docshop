#' Writes serialized, in-memory object to S3
#' @export

s3write_csv = function(data, object, aws = TRUE) {
  if (str_detect(object, 's3://')) {
    x <- rawConnection(raw(0), "w")
    # utils::write.csv(data, x, row.names=FALSE)
    readr::write_csv(data, x)
    put_object(rawConnectionValue(x), object = object)
  } else {
    dir.create(dirname(object), recursive= TRUE,showWarnings = FALSE)
    fwrite(data, object)
  }
}
#' Generate tempfile name
#' @description Creates a tempfile name for use when saving objects to S3 (i.e. to prevent data from being permanently saved to the computer during intermediary steps).
#' @param ext File extension for the temp file.
#' @export

  tmp_generate = function(ext=".fst") {
    tmp = paste0("temp",sample(1:10000000,1),ext)
    while (file.exists(tmp)) {
      tmp = paste0("temp",sample(1:10000000,1),ext)
    }
    return(tmp)
  }
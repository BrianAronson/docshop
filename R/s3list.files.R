#' s3.list.files
#' @description A version of R's list.files function compatible with s3. By default, this is set to return up to only 1000 file names, only only the short name (i.e. excluding file paths). Note: A key difference between this function and list.files is that this function will return all files within subdirectories of a folder.
#' @export

s3.list.files<-function(x, full.names=F, max.files=1000){
  #1) make function for finding extracting bucket name (in case included in x)
      prefix.fun <- function(x) gsub("s3://iuni-doctorshopping/", "", x)
  #2) find files in bucket
      bucket.path <- get_bucket("s3://iuni-doctorshopping/", max = max.files, prefix = prefix.fun(x))
  #3) extract file names
      key.names <- as.vector(sapply(bucket.path, function(x) x[[1]]))
  #4) create versions of file names including full path and excluding full path
      full.return.names <- file.path("s3://iuni-doctorshopping/", key.names)
      short.return.names <- gsub("(.*/\\s*(.*$))", "\\2", key.names)
  #5) return file names according to whether full.names set to TRUE
      if(full.names){
           return(full.return.names)
      }else{
          return(short.return.names)
      }
}
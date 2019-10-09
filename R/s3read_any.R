#' Reads fst, csv, and gz objects from S3; may cause errors for csv.gz
#' @param awfile The path and file you want to read from aws
#' @param localdirec A local directory that might have that same file
#' @param localfile Search for file locally before downloading it from AWS
#' @export
#' @example {
#'     s3read(awsfile="s3://iuni-doctorshopping/derived_R_v3/pdmp_outcomes_zipcode_level/ZIP5/year/zip5_zipcode2007_pdmp.csv")
#' }

s3read_any = function(awsfile, localdirec=NULL,localfile = TRUE, ...) {
  #1) determine file type
      filetype <- tools::file_ext(awsfile)
  #2) search for file locally first
      if (localfile) {
      #a) find file name
          filename <- unlist(strsplit(awsfile, "/"))
          filename <- filename[length(filename)]
      #b) set to current work directory if no local direc provided
          if (is.null(localdirec)) {
              localdirec <- getwd()
          }
      #c) find out whether file name specified in localdirec
          namespecified <- grepl(filename, localdirec)
      #d) if file name not specified in local directory
          if (!namespecified) {
          #i) account for whether local directory included a backslash
              hasslash <-
                substr(localdirec, nchar(localdirec), nchar(localdirec)) == "/"
              if (!hasslash) {
                localdirec <- paste(localdirec, "/", sep = "")
              }
          #ii) change localdirec to include file name
              localdirec <- paste(localdirec, filename, sep = "")
        }
      #e) find that file in local directory;
          if (file.exists(localdirec)) {
            tmp <- localdirec
          }
    }
  #3) otherwise grab from aws
      #a) pull info from awsfile
          AWS.bucket <- get_bucketname(awsfile)
          AWS.file.name <- gsub(AWS.bucket, "", awsfile)
          AWS.file.name <- gsub("s3:///", "", AWS.file.name)
      #b) read file depending on file type
          if(filetype == "fst") {
            s3read_using(FUN = read_fst, as.data.table = TRUE, object = AWS.file.name, bucket = AWS.bucket, ...)
          }else{
            s3read_using(FUN = fread, object = AWS.file.name, bucket = AWS.bucket, ...)
          }
}
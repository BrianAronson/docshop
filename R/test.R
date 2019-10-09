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
      filetype<-tools::file_ext(awsfile)      
  #2) search for file locally first
      if(localfile){
        #a) find file name
            filename<-unlist(strsplit(awsfile,"/"))
            filename<-filename[length(filename)]
        #b) set to current work directory if no local direc provided
            if(is.null(localdirec)){
              localdirec<-getwd()
            }
        #c) find out whether file name specified in localdirec
            namespecified<-grepl(filename,localdirec)
                
        #d) if file name not specified in local directory
            if(!namespecified){
            #i) account for whether local directory included a backslash
                hasslash<-substr(localdirec,nchar(localdirec),nchar(localdirec))=="/"
                if(!hasslash){
                  localdirec<-paste(localdirec,"/",sep="")
                }
            #ii) change localdirec to include file name
                localdirec<-paste(localdirec,filename,sep="")
            }
        #e) find that file in local directory; 
            if(file.exists(localdirec)){
              tmp<-localdirec
            }
            aws<-F
      }
  
  #3) otherwise grab from aws
      if(!exists("tmp")){
          tmp <- tmp_generate(paste(".",filetype,sep=""))
          bucket <- get_bucketname(awsfile)
          save_object(bucket = bucket,
                    object = awsfile,
                    file = tmp)    
          aws<-T
      }
  #3) read file depending on file type
      #b) if file type is fst
          if(filetype=="fst"){
              data = read_fst(tmp, as.data.table = TRUE, ...)  
          }else{
              data = fread(tmp, ...)  
          }
      #c) if the file was downloaded from aws, remove it from pc
          if(aws){
              file.remove(tmp)
          }
      #d) garbage clean
          invisible(gc())
          return(data)
}

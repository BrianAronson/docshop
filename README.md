## Outline
This package includes many functions created by BK and others for our doctor shopping project. Users are encouraged to document, add functions, and edit current functions as desired. 

## Installation
To install, one must run both of the following lines:

    Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS = TRUE) 
    devtools::install_github("BrianAronson/docshop")
Usually, the Sys.setenv function is not necessary, but due to this package's many dependencies, when installing the package, R will likely throw warnings that some of the functions were developed for different versions of R, and these warnings will be converted to errors that prevent installation.

## Usage
Users can load the package with:

    library(docshop)

## Editing the package
Users are encouraged to document, add functions, and edit current functions as desired. My typical workflow is to copy new functions to the docshop/R folder, set my work directory to the package directory, and use roxygen2::roxygenize() to update the package's documentation. From there, I simply add the new files in docshop/R and docshop/man to github, and replace the NAMESPACE file in the main docshop folder. If unsure how to add or document a function, I recommend using s3write_fst.R as a guide. If unsure how to use roxygenize, please email me the function (.R file) directly and I will do so for you.

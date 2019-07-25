#' Calculates median latitudes and longitudes based on input
#' @export

geographic_average <- function(lat, lng, weight = NULL){
  if (is.null(weight)) {
    weight <- rep(1, length(lng))
  }
  mean_lat <- weighted.mean(lat, w = weight)
  mean_lng <- weighted.mean(lng, w = weight)
  list(lat = mean_lat, lng = mean_lng)
}
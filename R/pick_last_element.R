#' Picks last element of input
#' @export

pick_last_element = function(x) {
  x = unlist(x)
  y = x[length(x)]
  return(y)
}
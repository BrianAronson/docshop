#' Extracts model coefficients
#' @export

extract.coef <- function(model, type = NULL) {
  if (is.null(type)) {
    s <- summary(model)
    names <- rownames(s$coef)
    co <- s$coef[, 1]
    se <- s$coef[, 2]
    pval <- s$coef[, 4]
  } else if (type == "bootstrap") {
    names = ""
    co = model$o.coef
    se = sd(model$boots)
    pval = NA
  }
  tr = data.table(
    coef.names = names,
    coef = co,
    se = se,
    pvalues = pval
  )
  return(tr)
}

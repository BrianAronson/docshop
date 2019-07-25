#' generate_first_last_date_table; unsure
#' @export

generate_first_last_date_table = function(from_year = 2007,
                                          to_year = 2017,
                                          time_unit = 'quarter') {
  if (time_unit == 'quarter') {
    yq_date_first_last = list()
    n = 1
    for (yy in from_year:to_year) {
      for (qq in 1:4) {
        quarter_first_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 1), "-01"))
        if (qq == 1 | qq == 4) {
          quarter_last_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 3), "-31"))
        } else {
          quarter_last_date = as.Date(paste0(yy, "-", month_of_quarter(qq, 3), "-30"))
        }
        yq_date_first_last[[n]] = data.table(
          year = yy,
          quarter = qq,
          first_date = quarter_first_date,
          last_date = quarter_last_date
        )
        n = n + 1
      }
    }
  } else if (time_unit == 'halfyear') {
    yq_date_first_last = list()
    n = 1
    for (yy in from_year:to_year) {
      for (hh in 1:2) {
        halfyear_first_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 1), "-01"))
        if (hy == 1) {
          halfyear_last_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 6), "-30"))
        } else {
          halfyear_last_date = as.Date(paste0(yy, "-", month_of_halfyear(hy, 6), "-31"))
        }
        yq_date_first_last[[n]] = data.table(
          year = yy,
          halfyear = hh,
          first_date = quarter_first_date,
          last_date = quarter_last_date
        )
        n = n + 1
      }
    }
  } else if (time_unit == 'year') {
    yq_date_first_last = list()
    n = 1
    for (yy in from_year:to_year) {
      yq_date_first_last[[n]] = data.table(
        year = yy,
        first_date = as.Date(paste0(yy, '-01-01')),
        last_date = as.Date(paste0(yy, '-12-31'))
      )
      n = n + 1
    }
  }
  return(rbindlist(yq_date_first_last))
}
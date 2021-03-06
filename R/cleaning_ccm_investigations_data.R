#' Cleaning CCM investigations data
#'
#' This function takes the raw CCM investigations data and cleans the field
#' names and coverts date objects to lubridate date objects.
#'
#' @param raw_ccm_investigations_data A tbl_df of raw CCM Investigations data.
#'
#' @return A tbl_df of clean CCM investigations data.
#' @export
#'
#' @examples
#' `cleaning_ccm_investigations_data(raw_ccm_investigations_data)`
cleaning_ccm_investigations_data <- function(raw_ccm_investigations_data) {
  raw_ccm_investigations_data %>%
    janitor::clean_names() %>%
    mutate(
      across(.cols = c(contains("date"), -episode_date_type), .fns = str_remove_all, pattern = "[\\.,]"),
      across(.cols = c(contains("date"), -episode_date_type), .fns = lubridate::parse_date_time, orders = c("%Y-%m-%d %I:%M %p", "%Y-%m-%d")),
      across(.cols = c(contains("date"), -episode_date_type), .fns = lubridate::as_date)
    ) %>%
    rename(!!!getting_ccm_investigations_field_names())
}

#' Joining CCM exposure investigations and exposures data
#'
#' This function takes the clean CCM exposure investigations transmission data,
#' the clean CCM exposure invesstigations acquisition data, and the clean
#' CCM exposures data and joins it together via the exposure.
#'
#' @param clean_ccm_exposure_investigations_transmission_data A tbl_df of clean
#' CCM exposure investigations - transmission data.
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure invesetigations - acquisition data.
#' @param clean_ccm_exposures_data A tbl_df of clean CCM exposures data.
#'
#' @return A tbl_df of joined CCM exposure investigations and CCM exposures
#' data.
#' @export
#'
#' @examples
#' `joining_ccm_exposure_investigations_and_exposures_data(clean_ccm_exposure_investigations_transmission_data, clean_ccm_exposure_investigations_acquisition_data,clean_ccm_exposures_data)`
joining_ccm_exposure_investigations_and_exposures_data <-
  function(clean_ccm_exposure_investigations_transmission_data,
           clean_ccm_exposure_investigations_acquisition_data,
           clean_ccm_exposures_data) {
    # joining our CCM exposure investigations - transmission and exposure
    # investigations - acquisition data by exposure.
    joining_ccm_exposure_investigations_data(
      clean_ccm_exposure_investigations_transmission_data,
      clean_ccm_exposure_investigations_acquisition_data
    ) %>%
      # joining the filtered CCM exposure investigations data and the clean
      # CCM exposures data by exposure.
      inner_join(
        y = clean_ccm_exposures_data,
        by = "exposure"
      )
  }

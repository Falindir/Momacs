#' Launches Momacs
#'
#' @param launch.browser `logical` whether to launch in a browser (`TRUE`) by default)
#' @return void
# #' @import colourpicker
#' @import shiny
#' @import downloader
#' @import httpuv
#' @import shinyBS
#' @import shinydashboard
#' @import shinyFiles
#' @import shinyjs
#' @import tools
#' @import yaml
#'
#' @examples
#' \dontrun{
#' acquire()
#' }
#' @export
acquire <- function(launch.browser=TRUE) {
  shiny::runApp("inst/momacs_shiny/",
                launch.browser=launch.browser)
}

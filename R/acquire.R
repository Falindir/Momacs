#' Launches Momacs
#'
#' Works better in Chrome or Safari than in Firefox and RStudio viewer.
#'
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
acquire <- function() {
  shiny::runApp("inst/momacs_shiny/",
                launch.browser=TRUE)
}

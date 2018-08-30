#' launches the shinyAppDemo app
#'
#'
#' @return void
#' @import colourpicker
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
#' go()
#' }
go <- function() {
  shiny::runApp("inst/momacs_shiny/")
}



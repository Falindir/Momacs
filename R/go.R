#' launches the shinyAppDemo app
#'
#'
#' @return shiny application object
#'
#' @examples
#' \dontrun{
#' go()
#' }
#'
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
#' @export go
go <- function() {
  shiny::shinyApp(ui = ui, server = server)
}


# prevents "no visible binding for global variable"
globalVariables(c("configs", "shortcut"))



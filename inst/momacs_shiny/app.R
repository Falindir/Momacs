# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# dependencies -----
library(httpuv)
library(downloader)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(yaml)
library(stringr)
library(shinyFiles)
library(tools)
library(shinyBS)
# library(colourpicker)

# we load Momacs settings
configs <<- yaml.load_file("config.yml")$setting

# we load Momacs keyboard shortcuts
shortcut <<- yaml.load_file("shortcut.yml")$shortcut

# source left_sidebar
source("./pages/page_def_home.R",      local = TRUE)
source("./pages/page_def_shortcut.R",  local = TRUE)
source("./pages/page_def_cosmetics.R", local = TRUE)
source("./R/left_sidebar.R",           local = TRUE)

style <- tags$style(HTML(readLines("www/added_styles.css")))

UI    <- dashboardPage(
  skin = "black",
  dashboardHeader(title=paste0("\U0001f6e0", " Momacs"), titleWidth = 140),
  dashboardSidebar(width = 140, LeftSidebar),
  dashboardBody(
    shinyjs::useShinyjs(),
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.readable.css")) ,
    tags$head(tags$script(src = "message-handler.js")),
    tags$head(tags$script(src =  "curves.js")),
    tags$head(style),

    # from left_sidebar and friends -----
    tabItems(
      tabItem(tabName = "Home",       tabHome),
      tabItem(tabName = "Shortcut",   tabShortcut),
      tabItem(tabName = "Cosmetics",  tabCosmetics)
    )
  )
)

server <- function( input, output, session) {

  source("./server/opt_home.R", local=TRUE)
  source("./server/opt_shortcut.R", local=TRUE)

  # send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)

  # send shortcut event to javascript
  session$sendCustomMessage(type = 'shortcut',
                            message = shortcut)
}

shinyApp(ui = UI, server = server)

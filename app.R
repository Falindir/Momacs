#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

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
library(colourpicker)

# we load settings of momacs
configs <<- yaml.load_file("config.yml")$setting

# we load shortcut of momacs
shortcut <<- yaml.load_file("shortcut.yml")$shortcut

source("./pages/page_def_home.R", local = T)
source("./pages/page_def_shortcut.R", local = T)
source("./R/menugauche.R", local = T)

style <- tags$style(HTML(readLines("www/added_styles.css")) )
UI <- dashboardPage(
  skin = "green",
  dashboardHeader(title="Momacs", titleWidth = 230),
  dashboardSidebar(width = 230, MenuGauche ),
  dashboardBody(
    shinyjs::useShinyjs(),
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.readable.css")) ,
    tags$head(tags$script(src = "message-handler.js")),
    tags$head(tags$script(src =  "curves.js")),
    tags$head(style),
    tabItems(
      tabItem(tabName = "Home",         tabHome),
      tabItem(tabName = "Shortcut",         tabShortcut)
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

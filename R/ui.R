
# Options and stuff ---------
# we load settings of momacs
# configs <<- yaml::yaml.load_file("config.yml")$setting
configs <<- list(color_background = "#D1D1D1", color_point = "#F52929", color_segment = "#04C237",
                 color_curve = "#305DF0", color_hover = "#8e44ad", color_text = "#00838F",
                 size_point = "5", size_hover = "3", size_segment = "2", size_curve = "2",
                 size_text = "10")

# we load shortcut of momacs
# shortcut <<- yaml::yaml.load_file("shortcut.yml")$shortcut
shortcut <<- list(save = "p", move = "m", clear = "l", nextI = "ArrowRight",
                  last = "ArrowDown", previous = "ArrowLeft", first = "ArrowUp",
                  drawPoint = "a", drawSegment = "q", drawCurve = "w", movePoint = "z",
                  moveSegment = "s", moveCurve = "x", deletePoint = "e", deleteSegment = "d",
                  deleteCurve = "c", newPointPartition = "r", newSegmentPartition = "f",
                  newCurvePartition = "v", deletePointPartition = "t", deleteSegmentPartition = "g",
                  deleteCurvePartition = "b", clearPointPartition = "y", clearSegmentPartition = "h",
                  clearCurvePartition = "n", addPointOnSegment = "j", addPointOnCurve = ",")

# style <- tags$style(HTML(readLines("www/added_styles.css")))
style <- ""

# Parts ---------------------

# def_home --------
tabHome = shiny::fluidPage(

  shinydashboard::box(width = 12,
                      title = "Action",
                      collapsible = TRUE,
                      status = "primary",
                      solidHeader = TRUE,

                      shinyFiles::shinyFilesButton('files', label='Load image file(s)', title='Please select a image files', multiple=TRUE, buttonType = "btn btn-primary"),
                      shinyFiles::shinyDirButton('dirs', label='Load image dir', title='Please select a image dir', buttonType = "btn btn-primary"),

                      shiny::br(),
                      shiny::br(),

                      shiny::fluidRow(

                        shiny::column(width = 4,
                                      shiny::selectInput("selectimages", "Chose image:", c())),

                        shiny::column(width = 2,
                                      shiny::selectInput("selectedPartitionPoint", "Partition points:",
                                                         choices = c("P0"), selected = NULL, multiple = FALSE,
                                                         selectize = FALSE)),
                        shiny::column(width = 2,
                                      shiny::selectInput("selectedPartitionSegment", "Partition segments:",
                                                         choices = c("S0"), selected = NULL, multiple = FALSE,
                                                         selectize = FALSE)),
                        shiny::column(width = 2,
                                      shiny::selectInput("selectedPartitionCurve", "Partition curves:",
                                                         choices = c("C0"), selected = NULL, multiple = FALSE,
                                                         selectize = FALSE))
                      ),

                      #shiny::actionButton("run", "",  icon("play"), class="btn btn-success"),
                      #shinyBS::bsTooltip("run", "Run", placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("saveI", "",
                                          shiny::icon("save"), class="btn btn-success"),
                      shinyBS::bsTooltip("saveI", "Save",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("lastI", "",
                                          shiny::icon("step-forward"), class="btn btn-success"),
                      shinyBS::bsTooltip("lastI", "Last",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("nextI", "",
                                          shiny::icon("arrow-right"),class="btn btn-success"),
                      shinyBS::bsTooltip("nextI", "Next",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("previousI", "",
                                          shiny::icon("arrow-left"), class="btn btn-success"),
                      shinyBS::bsTooltip("previousI", "Previous",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("firstI", "",
                                          shiny::icon("step-backward"), class="btn btn-success"),
                      shinyBS::bsTooltip("firstI", "First",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("buttonMoveImage", "",
                                          shiny::icon("arrows"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonMoveImage", "Move image",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::actionButton("clearImage", "",
                                          shiny::icon("eraser"), class="btn btn-success"),
                      shinyBS::bsTooltip("clearImage", "Clear image",
                                         placement = "top", trigger = "hover", options = NULL),

                      shiny::br(),
                      shiny::br(),

                      shiny::actionButton("buttonDrawPoint", "Point",
                                          shiny::icon("pencil"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDrawPoint", "Draw point",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonMovePoint", "Point",
                                          shiny::icon("arrows"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonMovePoint", "Move point",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePoint", "Point",
                                          shiny::icon("trash"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePoint", "Delete point",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonNewPartitionPoint", "Point",
                                          shiny::icon("plus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonNewPartitionPoint", "Create new point partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePartitionPoint", "Point",
                                          shiny::icon("minus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePartitionPoint", "Delete current point partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonClearPartitionPoint", "Point",
                                          shiny::icon("eraser"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonClearPartitionPoint", "Clear current point partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::br(),
                      shiny::br(),

                      shiny::actionButton("buttonDrawSegment", "Segment",
                                          shiny::icon("pencil"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDrawSegment", "Draw segment",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonMovePointSegment", "Segment",
                                          shiny::icon("arrows"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonMovePointSegment", "Move point on segment",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePointSegment", "Segment",
                                          shiny::icon("trash"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePointSegment", "Delete point and segment",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonNewPartitionSegment", "Segment",
                                          shiny::icon("plus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonNewPartitionSegment", "Create new segment partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePartitionSegment", "Segment",
                                          shiny::icon("minus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePartitionSegment", "Delete current segment partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonClearPartitionSegment", "Segment",
                                          shiny::icon("eraser"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonClearPartitionSegment", "Clear current segment partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonAddPointOnSegment", "Segment",
                                          shiny::icon("edit"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonAddPointOnSegment", "Add point on segment",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::br(),
                      shiny::br(),

                      shiny::actionButton("buttonDrawCurve", "Curve",
                                          shiny::icon("pencil"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDrawCurve", "Draw curve",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonMovePointCurve", "Curve",
                                          shiny::icon("arrows"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonMovePointCurve", "Move point on curve",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePointCurve", "Curve",
                                          shiny::icon("trash"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePointCurve", "Delete point and curve",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonNewPartitionCurve", "Curve",
                                          shiny::icon("plus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonNewPartitionCurve", "Create new curve partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonDeletePartitionCurve", "Curve",
                                          shiny::icon("minus"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonDeletePartitionCurve", "Delete current curve partition", placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonClearPartitionCurve", "Curve",
                                          shiny::icon("eraser"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonClearPartitionCurve", "Clear current curve partition",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::actionButton("buttonAddPointOnCurve", "Curve",
                                          shiny::icon("edit"), class="btn btn-success"),
                      shinyBS::bsTooltip("buttonAddPointOnCurve", "Add point on curve",
                                         placement = "top", trigger = "hover",  options = NULL),

                      shiny::br(), shiny::br(),

                      shiny::radioButtons("typeCurve", "Type of curve:",
                                          choices = list("LineString" = "open", "Polygon" = "close"), selected = "close")

  ),

  # shinydashboard::box(width = 12,
  #                     shiny::includeHTML(path = "image.html")
  # )

  shinydashboard::box(width = 12,
                      shiny::includeHTML("./www/image.html")
  )

)
# def_shortcut ----

tabShortcut = shiny::fluidPage(
  shinydashboard::box(width = 12,

                      shiny::textInput("saveSC", "Save image :", shortcut$save, width = "300px"),

                      shiny::textInput("moveSC", "Move image :", shortcut$move, width = "300px"),

                      shiny::textInput("clearSC", "Clear image :", shortcut$clear, width = "300px"),

                      shiny::textInput("nextSC", "Pass to next image :", shortcut$nextI, width = "300px"),

                      shiny::textInput("lastSC", "Pass to last image :", shortcut$last, width = "300px"),

                      shiny::textInput("previousSC", "Pass to previous image :", shortcut$previous, width = "300px"),

                      shiny::textInput("firstSC", "Pass to first image image :", shortcut$first, width = "300px"),

                      shiny::textInput("drawPointSC", "Draw point :", shortcut$drawPoint, width = "300px"),

                      shiny::textInput("drawSegmentSC", "Draw segment :", shortcut$drawSegment, width = "300px"),

                      shiny::textInput("drawCurveSC", "Draw curve :", shortcut$drawCurve, width = "300px"),

                      shiny::textInput("movePointSC", "Move point :", shortcut$movePoint, width = "300px"),

                      shiny::textInput("moveSegmentSC", "Move point of segment :", shortcut$moveSegment, width = "300px"),

                      shiny::textInput("moveCurveSC", "Move point of curve :", shortcut$moveCurve, width = "300px"),

                      shiny::textInput("deletePointSC", "Delete point :", shortcut$deletePoint, width = "300px"),

                      shiny::textInput("deleteSegmentSC", "Delete point of segment :", shortcut$deleteSegment, width = "300px"),

                      shiny::textInput("deleteCurveSC", "Delete point of curve :", shortcut$deleteCurve, width = "300px"),

                      shiny::textInput("newPointPartitionSC", "Create new point partition :", shortcut$newPointPartition, width = "300px"),

                      shiny::textInput("newSegmentPartitionSC", "Create new segment partition :", shortcut$newSegmentPartition, width = "300px"),

                      shiny::textInput("newCurvePartitionSC", "Create new curve partition :", shortcut$newCurvePartition, width = "300px"),

                      shiny::textInput("deletePointPartitionSC", "Delete current point partition :", shortcut$deletePointPartition, width = "300px"),

                      shiny::textInput("deleteSegmentPartitionSC", "Delete current segment partition :", shortcut$deleteSegmentPartition, width = "300px"),

                      shiny::textInput("deleteCurvePartitionSC", "Delete current curve partition :", shortcut$deleteCurvePartition, width = "300px"),

                      shiny::textInput("clearPointPartitionSC", "Clear current point partition :", shortcut$clearPointPartition, width = "300px"),

                      shiny::textInput("clearSegmentPartitionSC", "Clear current segment partition :", shortcut$clearSegmentPartition, width = "300px"),

                      shiny::textInput("clearCurvePartitionSC", "Clear current curve partition :", shortcut$clearCurvePartition, width = "300px"),

                      shiny::textInput("addPointOnSegmentSC", "Add point on segment :", shortcut$addPointOnSegment, width = "300px"),

                      shiny::textInput("addPointOnCurveSC", "Add point on curve :", shortcut$addPointOnCurve, width = "300px"),

                      shiny::actionButton("saveShortcut", "Save shortcut", class="btn btn-primary")
  )
)

tabCosmetics = shiny::fluidPage(
  shinydashboard::box(width = 12,
                      shiny::sliderInput("sizePoint", "Size points:", min=0.5, max=10, value=configs$size_point, step=0.5),

                      shiny::sliderInput("sizeSegment", "Size segments:", min=0.5, max=10, value=configs$size_segment, step=0.5),

                      shiny::sliderInput("sizeCurve", "Size curves:", min=0.5, max=10, value=configs$size_curve, step=0.5),

                      shiny::sliderInput("sizeTexte", "Size textes:", min=1, max=20, value=configs$size_text, step=1),

                      colourpicker::colourInput("colorBackground", "Colour background:", configs$color_background),

                      colourpicker::colourInput("colorPoint", "Colour points:", configs$color_point),

                      colourpicker::colourInput("colorSegment", "Colour segments:", configs$color_segment),

                      colourpicker::colourInput("colorCurves", "Colour curves:", configs$color_curve),

                      colourpicker::colourInput("colorTextes", "Colour textes:", configs$color_text),

                      shiny::actionButton("saveSetting", "Save settings", class="btn btn-primary")
  )
)

# sidebar ---------
MenuGauche = shinydashboard::sidebarMenu(
  id = "sidebarmenu",

  shinydashboard::menuItem("Home", tabName = "Home",  icon = shiny::icon("home", lib="font-awesome"), newtab = FALSE),

  shinydashboard::menuItem("Shortcut", tabName = "Shortcut",  icon = shiny::icon("key", lib="font-awesome"), newtab = FALSE),

  shinydashboard::menuItem("Cosmetics", tabName = "Cosmetics",  icon = shiny::icon("file", lib="font-awesome"), newtab = FALSE)

)


# ui stricto sensu ----------
ui <- shinydashboard::dashboardPage(
  skin = "green",
  shinydashboard::dashboardHeader(title="Momacs", titleWidth = 230),
  shinydashboard::dashboardSidebar(width = 230, MenuGauche ),
  shinydashboard::dashboardBody(
    shinyjs::useShinyjs(),
    shiny::tags$head(shiny::tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.readable.css")) ,
    shiny::tags$head(shiny::tags$script(src = "message-handler.js")),
    shiny::tags$head(shiny::tags$script(src =  "curves.js")),
    shiny::tags$head(style),
    shinydashboard::tabItems(
      shinydashboard::tabItem(tabName = "Home", tabHome),
      shinydashboard::tabItem(tabName = "Shortcut", tabShortcut),
      shinydashboard::tabItem(tabName = "Cosmetics", tabCosmetics)
    )
  )
)

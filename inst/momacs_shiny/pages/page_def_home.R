tabHome <- fluidPage(

  # Action box --------------------------------------------
  box(
    width = 12,
    title = "Action",
    collapsible = TRUE,
    status = "primary",
    solidHeader = TRUE,

    # drag and drop section (exp)
    fileInput(inputId = "plop", label="yop", multiple = TRUE, accept=c(".jpg", ".png")),

    # shinyFiles file/dir selectors
    shinyFilesButton("files",
                     label = "Load image(s)",
                     title = "Please select a image files",
                     multiple = TRUE,
                     buttonType = "btn btn-primary"),

    shinyDirButton("dirs",
                   label = "Load folder",
                   title = "Please select a image dir",
                   buttonType = "btn btn-primary")
  ), br(),

  # Acquisition box ---------------------------------------
  box(
    width = 12,
    title = "Acquisition",
    collapsible = TRUE,
    status = "primary",
    solidHeader = TRUE,

    fluidRow(
      # Image selection -----
      column(
        width = 4,
        selectInput("selectimages", "Chose image:", c())
      ),
      # Partition selection -----
      column(
        width = 2,
        selectInput("selectedPartitionPoint", "Point partition:",
                    choices = c("P0"),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = FALSE
        )
      ),
      column(
        width = 2,
        selectInput("selectedPartitionSegment", "Segments partition:",
                    choices = c("S0"),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = FALSE
        )
      ),
      column(
        width = 2,
        selectInput("selectedPartitionCurve", "Curves partition:",
                    choices = c("C0"),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = FALSE
        )
      )
    ),

    # Button section -----
    # actionButton("run", "",  icon("play"), class="btn btn-success"),
    # bsTooltip("run", "Run", placement = "top", trigger = "hover", options = NULL),

    actionButton("saveI", "", icon("save"), class = "btn btn-success"),
    bsTooltip("saveI", "Save", placement = "top", trigger = "hover", options = NULL),

    actionButton("lastI", "", icon("step-forward"), class = "btn btn-success"),
    bsTooltip("lastI", "Last", placement = "top", trigger = "hover", options = NULL),

    actionButton("nextI", "", icon("arrow-right"), class = "btn btn-success"),
    bsTooltip("nextI", "Next", placement = "top", trigger = "hover", options = NULL),

    actionButton("previousI", "", icon("arrow-left"), class = "btn btn-success"),
    bsTooltip("previousI", "Previous", placement = "top", trigger = "hover", options = NULL),

    actionButton("firstI", "", icon("step-backward"), class = "btn btn-success"),
    bsTooltip("firstI", "First", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonMoveImage", "", icon("arrows"), class = "btn btn-success"),
    bsTooltip("buttonMoveImage", "Move image", placement = "top", trigger = "hover", options = NULL),

    actionButton("clearImage", "", icon("eraser"), class = "btn btn-success"),
    bsTooltip("clearImage", "Clear image", placement = "top", trigger = "hover", options = NULL),

    br(), br(),


    actionButton("buttonDrawPoint", "Point", icon("pencil"), class = "btn btn-success"),
    bsTooltip("buttonDrawPoint", "Draw point", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonMovePoint", "Point", icon("arrows"), class = "btn btn-success"),
    bsTooltip("buttonMovePoint", "Move point", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePoint", "Point", icon("trash"), class = "btn btn-success"),
    bsTooltip("buttonDeletePoint", "Delete point", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonNewPartitionPoint", "Point", icon("plus"), class = "btn btn-success"),
    bsTooltip("buttonNewPartitionPoint", "Create new point partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePartitionPoint", "Point", icon("minus"), class = "btn btn-success"),
    bsTooltip("buttonDeletePartitionPoint", "Delete current point partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonClearPartitionPoint", "Point", icon("eraser"), class = "btn btn-success"),
    bsTooltip("buttonClearPartitionPoint", "Clear current point partition", placement = "top", trigger = "hover", options = NULL),

    br(), br(),

    actionButton("buttonDrawSegment", "Segment", icon("pencil"), class = "btn btn-success"),
    bsTooltip("buttonDrawSegment", "Draw segment", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonMovePointSegment", "Segment", icon("arrows"), class = "btn btn-success"),
    bsTooltip("buttonMovePointSegment", "Move point on segment", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePointSegment", "Segment", icon("trash"), class = "btn btn-success"),
    bsTooltip("buttonDeletePointSegment", "Delete point and segment", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonNewPartitionSegment", "Segment", icon("plus"), class = "btn btn-success"),
    bsTooltip("buttonNewPartitionSegment", "Create new segment partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePartitionSegment", "Segment", icon("minus"), class = "btn btn-success"),
    bsTooltip("buttonDeletePartitionSegment", "Delete current segment partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonClearPartitionSegment", "Segment", icon("eraser"), class = "btn btn-success"),
    bsTooltip("buttonClearPartitionSegment", "Clear current segment partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonAddPointOnSegment", "Segment", icon("edit"), class = "btn btn-success"),
    bsTooltip("buttonAddPointOnSegment", "Add point on segment", placement = "top", trigger = "hover", options = NULL),

    br(), br(),

    actionButton("buttonDrawCurve", "Curve", icon("pencil"), class = "btn btn-success"),
    bsTooltip("buttonDrawCurve", "Draw curve", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonMovePointCurve", "Curve", icon("arrows"), class = "btn btn-success"),
    bsTooltip("buttonMovePointCurve", "Move point on curve", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePointCurve", "Curve", icon("trash"), class = "btn btn-success"),
    bsTooltip("buttonDeletePointCurve", "Delete point and curve", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonNewPartitionCurve", "Curve", icon("plus"), class = "btn btn-success"),
    bsTooltip("buttonNewPartitionCurve", "Create new curve partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonDeletePartitionCurve", "Curve", icon("minus"), class = "btn btn-success"),
    bsTooltip("buttonDeletePartitionCurve", "Delete current curve partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonClearPartitionCurve", "Curve", icon("eraser"), class = "btn btn-success"),
    bsTooltip("buttonClearPartitionCurve", "Clear current curve partition", placement = "top", trigger = "hover", options = NULL),

    actionButton("buttonAddPointOnCurve", "Curve", icon("edit"), class = "btn btn-success"),
    bsTooltip("buttonAddPointOnCurve", "Add point on curve", placement = "top", trigger = "hover", options = NULL),

    br(), br(),

    radioButtons("typeCurve", "Type of curve:", choices = list("LineString" = "open", "Polygon" = "close"), selected = "close")
  ),
  # ),

  # Canvas box -----
  box(
    width = 12,
    includeHTML(path = "./www/image.html")
  )
)

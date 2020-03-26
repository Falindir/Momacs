tabShortcut = fluidPage(
  box(width = 6,

      textInput("saveSC", "Save image :", shortcut$save, width = "300px"),

      textInput("moveSC", "Move image :", shortcut$move, width = "300px" ),

      textInput("clearSC", "Clear image :", shortcut$clear, width = "300px" ),

      textInput("nextSC", "Pass to next image :", shortcut$nextI, width = "300px" ),

      textInput("lastSC", "Pass to last image :", shortcut$last, width = "300px" ),

      textInput("previousSC", "Pass to previous image :", shortcut$previous, width = "300px" ),

      textInput("firstSC", "Pass to first image image :", shortcut$first, width = "300px" ),

      textInput("drawPointSC", "Draw point :", shortcut$drawPoint, width = "300px" ),

      textInput("drawSegmentSC", "Draw segment :", shortcut$drawSegment, width = "300px" ),

      textInput("drawCurveSC", "Draw curve :", shortcut$drawCurve, width = "300px" ),

      textInput("movePointSC", "Move point :", shortcut$movePoint, width = "300px" ),

      textInput("moveSegmentSC", "Move point of segment :", shortcut$moveSegment, width = "300px" ),

      textInput("moveCurveSC", "Move point of curve :", shortcut$moveCurve, width = "300px" ),

      textInput("deletePointSC", "Delete point :", shortcut$deletePoint, width = "300px" ),

      textInput("deleteSegmentSC", "Delete point of segment :", shortcut$deleteSegment, width = "300px" ),

      textInput("deleteCurveSC", "Delete point of curve :", shortcut$deleteCurve, width = "300px" ),

      textInput("newPointPartitionSC", "Create new point partition :", shortcut$newPointPartition, width = "300px" ),

      textInput("newSegmentPartitionSC", "Create new segment partition :", shortcut$newSegmentPartition, width = "300px" ),

      textInput("newCurvePartitionSC", "Create new curve partition :", shortcut$newCurvePartition, width = "300px" ),

      textInput("deletePointPartitionSC", "Delete current point partition :", shortcut$deletePointPartition, width = "300px" ),

      textInput("deleteSegmentPartitionSC", "Delete current segment partition :", shortcut$deleteSegmentPartition, width = "300px" ),

      textInput("deleteCurvePartitionSC", "Delete current curve partition :", shortcut$deleteCurvePartition, width = "300px" ),

      textInput("clearPointPartitionSC", "Clear current point partition :", shortcut$clearPointPartition, width = "300px" ),

      textInput("clearSegmentPartitionSC", "Clear current segment partition :", shortcut$clearSegmentPartition, width = "300px" ),

      textInput("clearCurvePartitionSC", "Clear current curve partition :", shortcut$clearCurvePartition, width = "300px" ),

      textInput("addPointOnSegmentSC", "Add point on segment :", shortcut$addPointOnSegment, width = "300px" ),

      textInput("addPointOnCurveSC", "Add point on curve :", shortcut$addPointOnCurve, width = "300px" ),

      actionButton("saveShortcut", "Save shortcut", class="btn btn-primary")

  )
)

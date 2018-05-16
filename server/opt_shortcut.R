#' Event when use Save Shortcut button
observeEvent(input$saveShortcut, {
  
  result <- "shortcut.yml"
  
  if(file.exists(result)) {
    file.remove(result)
  }
  
  file.create(result);
  
  fileConn<-file(result)

  txt <- paste0('shortcut:\n')
  txt <- paste0(txt, '  save: "', input$saveSC, '"\n')
  txt <- paste0(txt, '  move: "', input$moveSC, '"\n')
  txt <- paste0(txt, '  clear: "', input$clearSC, '"\n')
  txt <- paste0(txt, '  nextI: "', input$nextSC, '"\n')
  txt <- paste0(txt, '  last: "', input$lastSC, '"\n')
  txt <- paste0(txt, '  previous: "', input$previousSC, '"\n')
  txt <- paste0(txt, '  first: "', input$firstSC, '"\n')
  txt <- paste0(txt, '  drawPoint: "', input$drawPointSC, '"\n')
  txt <- paste0(txt, '  drawSegment: "', input$drawSegmentSC, '"\n')
  txt <- paste0(txt, '  drawCurve: "', input$drawCurveSC, '"\n')
  txt <- paste0(txt, '  movePoint: "', input$movePointSC, '"\n')
  txt <- paste0(txt, '  moveSegment: "', input$moveSegmentSC, '"\n')
  txt <- paste0(txt, '  moveCurve: "', input$moveCurveSC, '"\n')
  txt <- paste0(txt, '  deletePoint: "', input$deletePointSC, '"\n')
  txt <- paste0(txt, '  deleteSegment: "', input$deleteSegmentSC, '"\n')
  txt <- paste0(txt, '  deleteCurve: "', input$deleteCurveSC, '"\n')
  txt <- paste0(txt, '  newPointPartition: "', input$newPointPartitionSC, '"\n')
  txt <- paste0(txt, '  newSegmentPartition: "', input$newSegmentPartitionSC, '"\n')
  txt <- paste0(txt, '  newCurvePartition: "', input$newCurvePartitionSC, '"\n')
  txt <- paste0(txt, '  deletePointPartition: "', input$deletePointPartitionSC, '"\n')
  txt <- paste0(txt, '  deleteSegmentPartition: "', input$deleteSegmentPartitionSC, '"\n')
  txt <- paste0(txt, '  deleteCurvePartition: "', input$deleteCurvePartitionSC, '"\n')
  txt <- paste0(txt, '  clearPointPartition: "', input$clearPointPartitionSC, '"\n')
  txt <- paste0(txt, '  clearSegmentPartition: "', input$clearSegmentPartitionSC, '"\n')
  txt <- paste0(txt, '  clearCurvePartition: "', input$clearCurvePartitionSC, '"\n')
  txt <- paste0(txt, '  addPointOnSegment: "', input$addPointOnSegmentSC, '"\n')
  txt <- paste0(txt, '  addPointOnCurve: "', input$addPointOnCurveSC, '"\n')
  
  writeLines(txt, fileConn)
  close(fileConn)
  
  shortcut <<- yaml.load_file("shortcut.yml")$shortcut
  
  session$sendCustomMessage(type = 'shortcut',
                            message = shortcut)
  
})
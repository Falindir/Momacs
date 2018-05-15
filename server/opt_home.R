#' Event when input size point change
observeEvent(input$sizePoint, {
  
  configs$size_point <<- input$sizePoint
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input size segment change
observeEvent(input$sizeSegment, {
  
  configs$size_segment <<- input$sizeSegment
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input size curve change
observeEvent(input$sizeCurve, {
  
  configs$size_curve <<- input$sizeCurve
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input size texte change
observeEvent(input$sizeTexte, {
  
  configs$size_text <<- input$sizeTexte
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input color background change
observeEvent(input$colorBackground, {
  
  configs$color_background <<- input$colorBackground
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input color point change
observeEvent(input$colorPoint, {
  
  configs$color_point <<- input$colorPoint
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input color segment change
observeEvent(input$colorSegment, {
  
  configs$color_segment <<- input$colorSegment
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input color curve change
observeEvent(input$colorCurves, {
  
  configs$color_curve <<- input$colorCurves
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when input color texte change
observeEvent(input$colorTextes, {
  
  configs$color_text <<- input$colorTextes
  
  # we send setting event to javascript
  session$sendCustomMessage(type = 'settings',
                            message = configs)
})

#====================================================================================

#' Event when use save settings button
observeEvent(input$saveSetting, {
  
  result <- "config.yml"
  
  if(file.exists(result)) {
    file.remove(result)
  }
  
  file.create(result);
  
  fileConn<-file(result)

  txt <- paste0('setting:\n')
  txt <- paste0(txt, '  color_background: "', configs$color_background, '"\n')
  txt <- paste0(txt, '  color_point: "', configs$color_point, '"\n')
  txt <- paste0(txt, '  color_segment: "', configs$color_segment, '"\n')
  txt <- paste0(txt, '  color_curve: "', configs$color_curve, '"\n')
  txt <- paste0(txt, '  color_hover: "', configs$color_hover, '"\n')
  txt <- paste0(txt, '  color_text: "', configs$color_text, '"\n')
  txt <- paste0(txt, '  size_point: "', configs$size_point, '"\n')
  txt <- paste0(txt, '  size_hover: "', configs$size_hover, '"\n')
  txt <- paste0(txt, '  size_segment: "', configs$size_segment, '"\n')
  txt <- paste0(txt, '  size_curve: "', configs$size_curve, '"\n')
  txt <- paste0(txt, '  size_text: "', configs$size_text, '"\n')
  
  # we rewrite the file "config.yml" with the new config
  writeLines(txt, fileConn)
  close(fileConn)
  
  configs <<- yaml.load_file("config.yml")$setting
  
})

#====================================================================================

#' Copie user image in www/images/tmp so javascript can handle it
#' @param images dataframe : info image (name, path)
gestion_image <- function(images) {
  
  imagesPath <- toString(images$datapath)
  imagesName <- toString(images$name)

  newFile <- "undefined"
  realPath <- "undefined"
  if(!is.null(images)) {
  
    os <- get_os()
    
    sep <- "/"
    
    if(os == "linux") {
      newdir <- "./www/images/tmp"
      realPath <-  "./images/tmp"
      
      if (!dir.exists(newdir)){
        dir.create("www/images")
        dir.create("www/images/tmp")
      } else {
        unlink("www/images/tmp/*")
      }
    
    } else if(os == "osx") {
      newdir <- "www/images/tmp"
      realPath <-  "images/tmp"
      
      if (!dir.exists(newdir)){
        dir.create("www/images")
        dir.create("www/images/tmp")
      } else {
        unlink("www/images/tmp/*")
      }
      
    } else {
      #TODO window
      sep <- "\\"
    }
    
    
    if (!dir.exists(newdir))
      dir.create(newdir)
    
    newFile <- paste0(newdir, sep, imagesName)
    realPath <- paste0(realPath, sep, imagesName)
    
    # on supprime l'image précédente si elle existe 
    if(!is.null(session$userData$lastjavascriptimage)) {
        if(file.exists(session$userData$lastjavascriptimage)) {
           file.remove(session$userData$lastjavascriptimage)
        }
    }
    
    #on stocke la nouvelle image
    session$userData$lastjavascriptimage <- newFile
    
    file.copy(imagesPath, newFile)
    
  }
  
  # on envoie l'évent run a javascript
  session$sendCustomMessage(type = 'run',
                            message = realPath)

}

#====================================================================================

#' Event when use load button
observeEvent(input$loadI, {
  images <- session$userData$imageFiles
  result2 <- paste0(file_path_sans_ext(images$datapath), ".yml");
  loadYamlFile(result2)
})

#====================================================================================

#' Event when use next button
observeEvent(input$nextI, {
  if(!is.null(session$userData$listimages)) {
    # we send end event to javascript
    session$sendCustomMessage(type = 'end', message = "next")
  }
})

#====================================================================================

#' Event when use save button
observeEvent(input$saveI, {
  if(!is.null(session$userData$listimages)) {
    # we send end event to javascript
    session$sendCustomMessage(type = 'end', message = "save")
  }
})

#====================================================================================

#' Event when use previous button
observeEvent(input$previousI, {
  if(!is.null(session$userData$listimages)) {
    # we send end event to javascript
    session$sendCustomMessage(type = 'end', message = "previous")
  }
})

#====================================================================================

#' Event when use first button
observeEvent(input$firstI, {
  if(!is.null(session$userData$listimages)) {
    # we send end event to javascript
    session$sendCustomMessage(type = 'end', message = "first")
  }
})

#====================================================================================

#' Event when use last button
observeEvent(input$lastI, {
  if(!is.null(session$userData$listimages)) {
    # we send end event to javascript
    session$sendCustomMessage(type = 'end', message = "last")
  }
})

#====================================================================================

#' Action when user change selected image
observeEvent(input$selectimages, {
  if(!is.null(session$userData$listimages)) {
  
    session$userData$imageFiles <- session$userData$listimages[grep(input$selectimages, session$userData$listimages$name),]
    
    session$userData$indexImage <- grep(input$selectimages, session$userData$listimages$name)[1]
    
    index <- paste0(session$userData$indexImage, " / ",  length(session$userData$listimages$datapath))
    
    # we send index event to javascript
    session$sendCustomMessage(type = 'index',
                              message = index)

    images <- session$userData$imageFiles
    gestion_image(images)
  }
})

#====================================================================================

#' Get the os of MoMacs run
#' @return string
get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

#====================================================================================

#' End event
observeEvent(input$end, {
  # we send end event to javascript
  session$sendCustomMessage(type = 'end', message = "")
})

#====================================================================================

roots = c(wd='/')
roots2 = c(wd='/')
shinyFileChoose(input, 'files', root=roots, filetypes=c("jpeg", "gif", "bmp", "png", "jpg"))
shinyDirChoose(input, 'dirs', session=session, roots = roots2)

#====================================================================================

#' Event when use shinyFilesButton
observeEvent(input$files, {
  roots = c(wd='/')
  images <- parseFilePaths(roots, input$files)
  

  session$userData$listimages <- cbind(images)
  
  session$userData$listimages$havemom <- logical(length = length(images$datapath))
  
  session$userData$indexImage <- 1
  
  index <- paste0(session$userData$indexImage, " / ",  length(images$datapath))
  
  session$sendCustomMessage(type = 'index',
                            message = index)
  
  #on selectionne la première
  session$userData$imageFiles <- session$userData$listimages[1,]
  
  images <- session$userData$imageFiles
  
  updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name)
  
 # gestion_image(images)
})

#====================================================================================

#' Event when use shinyDirButton
observeEvent(input$dirs, {
  roots2 = c(wd='/')
  dir = parseDirPath(roots2, input$dirs)
  
  ff <- list.files(path = parseDirPath(roots2, input$dirs))
  
  dbjpg <- ff[grep(".jpg", ff, fixed=T)]
  dbpng <- ff[grep(".png", ff, fixed=T)]
  dbbmp <- ff[grep(".bmp", ff, fixed=T)]
  dbjpeg <- ff[grep(".jpeg", ff, fixed=T)]
  dd <- c(dbjpg, dbpng, dbbmp, dbjpeg)

  name = c()
  datapath = c()
  
  for(n in dd ) {
    name <- c(name, n)
    datapath <- c(datapath, paste(dir, n, sep="/"))
  }
  
  images <- data.frame(name=name, datapath=datapath)
  rownames(images) <- c(0:(length(dd)-1))

  session$userData$listimages <- cbind(images)
  session$userData$listimages$havemom <- logical(length = length(images$datapath))
  
  session$userData$indexImage <- 1
  
  index <- paste0(session$userData$indexImage, " / ",  length(images$datapath))
  
  session$sendCustomMessage(type = 'index',
                            message = index)
  
  #on selectionne la première
  session$userData$imageFiles <- session$userData$listimages[1,]
  
  images <- session$userData$imageFiles
  
  updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name)
  
})

#====================================================================================

#' Load yml file
#' @param yaml_file : Path of yml file
loadYamlFile <- function(yaml_file) {
  
  if(file.exists(yaml_file)) {
    
      dataprevious <- yaml.load_file(yaml_file)
    
      session$sendCustomMessage(type = 'load',
                                message = dataprevious)
  } else  {
    session$sendCustomMessage(type = 'new',
                              message = "nothing")
  }
}

#====================================================================================

#' Save yml file
#' @param images : 
#' @param input : Input shiny
#' @param result : the path of yml file
saveYamlFile <- function (images, input, result) {
  
  if(file.exists(result)) {
    file.remove(result)
  }
  
  file.create(result);
  
  fileConn<-file(result)
  
  imagesPath <- toString(images$datapath)
  imagesName <- toString(images$name)
  
  txt <- paste0('result:\n')
  txt <- paste0(txt, '  name: "', imagesName, '"\n')
  txt <- paste0(txt, '  path: "', imagesPath, '"\n')
  txt <- paste0(txt, input$endImage$partitions$YML)
  
  writeLines(txt, fileConn)
  close(fileConn)
}

#====================================================================================

#' Save mom file
#' @param images : 
#' @param input : Input shiny
#' @param result : the path of mom file
saveMomFile <- function (images, input, result) {
  
  if(file.exists(result)) {
    file.remove(result)
  }
  
  file.create(result);
  
  imagesPath <- toString(images$datapath)
  imagesName <- toString(images$name)
  
  fileConn<-file(result)
  
  txt <- paste0("#Name ", imagesName, "\n")
  txt <- paste0(txt, "#Path ", imagesPath, "\n")
  txt <- paste0(txt, input$endImage$partitions$MOM)
  
  writeLines(txt, fileConn)
  close(fileConn)
}

#====================================================================================

#' Event end image
observeEvent(input$endImage, {
  
  size <- length(session$userData$listimages$datapath)
  
  images <- session$userData$imageFiles
  
  result <- paste0(file_path_sans_ext(images$datapath), ".mom");
  
  result2 <- paste0(file_path_sans_ext(images$datapath), ".yml");
  
  saveMomFile(images, input, result)
  
  saveYamlFile(images, input, result2)
  
  if(input$endImage$typeevent == "next") { 
    
    if(session$userData$indexImage < size) {
      
      session$userData$indexImage <- session$userData$indexImage + 1
      
      session$userData$imageFiles <- session$userData$listimages[session$userData$indexImage,]
      
      
      index <- paste0(session$userData$indexImage, " / ",  length(session$userData$listimages$datapath))
      
      session$sendCustomMessage(type = 'index',
                                message = index)
    
      images <- session$userData$imageFiles
      
      updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name, selected = session$userData$imageFiles$name)
    } 
    
  } else if(input$endImage$typeevent == "previous") {

    if(session$userData$indexImage > 1) {
      
      
      session$userData$indexImage <- session$userData$indexImage - 1
      
      session$userData$imageFiles <- session$userData$listimages[session$userData$indexImage,]
      
      index <- paste0(session$userData$indexImage, " / ",  length(session$userData$listimages$datapath))
      
      session$sendCustomMessage(type = 'index',
                                message = index)
      
      images <- session$userData$imageFiles
      
      updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name, selected = session$userData$imageFiles$name)
    
    } 
    
  } else if(input$endImage$typeevent == "first") {
      session$userData$indexImage <- 1
      
      session$userData$imageFiles <- session$userData$listimages[session$userData$indexImage,]
      
      index <- paste0(session$userData$indexImage, " / ",  length(session$userData$listimages$datapath))
      
      session$sendCustomMessage(type = 'index',
                                message = index)
      

      images <- session$userData$imageFiles
      
      updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name, selected = session$userData$imageFiles$name)
  
  } else if(input$endImage$typeevent == "last") {
    
        session$userData$indexImage <- length(session$userData$listimages$datapath)
        
        session$userData$imageFiles <- session$userData$listimages[session$userData$indexImage,]
        
        index <- paste0(session$userData$indexImage, " / ",  length(session$userData$listimages$datapath))
        
        session$sendCustomMessage(type = 'index',
                                  message = index)
        
        images <- session$userData$imageFiles
        
        updateSelectInput(session, "selectimages", label = "Chose image:", choices = session$userData$listimages$name, selected = session$userData$imageFiles$name)
  }

})

#====================================================================================
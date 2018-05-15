/**
 * setting event from shiny
 * Use for change settings of Momacs
 **/
Shiny.addCustomMessageHandler("settings",

  function(settings) {
    
    momacs_config = settings;
    canvas.pointSize = parseInt(momacs_config.size_point) + parseInt(momacs_config.size_hover);
    
    if(canvas.started ) {
        canvas.redraw();
    }
  }

);

//===========================================================================

/**
 * shortcut event from shiny
 * Use for change shortcut of Momacs
 **/
Shiny.addCustomMessageHandler("shortcut",

  function(shortcut) {
    
    momacs_shortcut = shortcut;

    if(canvas.started ) {
        canvas.redraw();
    }
  }

);

//===========================================================================

/**
 * run event from shiny
 * Use for draw image from wwww/images/tmp/ and load .yml if exist
 **/
Shiny.addCustomMessageHandler("run",
  
  function(path_image) {
  
     if(path_image == "undefined" || path_image == "./images/tmp/" || path_image == "images/tmp/") {
        alert("Please, load image before run");
     } else {
       
       var lengthimageslist = document.getElementById("selectimages").length;
       
        canvas.started = true;
        canvas.imagePath = path_image;
        drawImage(path_image);
        
        // we send loadI event to shiny
        Shiny.onInputChange("loadI", path_image);
     }
  }
);

//===========================================================================

/**
 * index event from Shiny
 * Use for change index of current image draw
 **/
Shiny.addCustomMessageHandler("index",

  function(indeximage) {
    $("#indeximagecanvas").html("<b>Images </b>: " + indeximage);
  }
);

//===========================================================================

/**
 * End event from Shiny
 * Use when event for change image is active (next, last, ...)
 **/
Shiny.addCustomMessageHandler("end",
  function(message) {
    
    if(!canvas.started) {
        alert("Please, load image before run");
    } else {
       canvas.typeevent = message;
       zone.save();
       canvas.partitions = zone;
       // we send endImage event to shiny
       Shiny.onInputChange("endImage", canvas);
    }
  }
);

//===========================================================================

/**
 * Load event from Shiny
 * Use for load image
 **/
Shiny.addCustomMessageHandler("load",
  function(message) {
    if(canvas.started) {
        canvas.newEnv();
        canvas.loadCanvas(message);
        canvas.redraw();
    }
  }

);

//===========================================================================

/**
 * New event from Shiny
 * Use for create new environement
 **/
Shiny.addCustomMessageHandler("new",
  function(message) {
    if(canvas.started) {
        canvas.newEnv();
        canvas.redraw();
    }
  }

);



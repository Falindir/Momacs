LeftSidebar <-
  sidebarMenu(id = "sidebarmenu",

              menuItem("Home",
                       tabName = "Home",
                       icon = icon("home", lib="font-awesome"),
                       newtab = FALSE),

              menuItem("Shortcut",
                       tabName = "Shortcut",
                       icon = icon("key", lib="font-awesome"),
                       newtab = FALSE),

              menuItem("Cosmetics",
                       tabName = "Cosmetics",
                       icon = icon("highlighter", lib="font-awesome"),
                       newtab= FALSE)
  )

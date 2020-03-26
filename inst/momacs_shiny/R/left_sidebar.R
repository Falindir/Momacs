LeftSidebar = sidebarMenu(id = "sidebarmenu",

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
                         )#,

                         # menuItem("Powered by mbb",  href = "http://mbb.univ-montp2.fr/MBB/index.php", newtab = TRUE, icon = icon("book", lib="font-awesome"), selected = NULL),
#
#                          sliderInput("sizePoint", "Size points:", min=0.5, max=10, value=configs$size_point, step=0.5),
#
#                          sliderInput("sizeSegment", "Size segments:", min=0.5, max=10, value=configs$size_segment, step=0.5),
#
#                          sliderInput("sizeCurve", "Size curves:", min=0.5, max=10, value=configs$size_curve, step=0.5),
#
#                          sliderInput("sizeTexte", "Size textes:", min=1, max=20, value=configs$size_text, step=1),
#
#                          colourInput("colorBackground", "Colour background:", configs$color_background),
#
#                          colourInput("colorPoint", "Colour points:", configs$color_point),
#
#                          colourInput("colorSegment", "Colour segments:", configs$color_segment),
#
#                          colourInput("colorCurves", "Colour curves:", configs$color_curve),
#
#                          colourInput("colorTextes", "Colour textes:", configs$color_text),
#
#                          actionButton("saveSetting", "Save settings", class="btn btn-primary")#,

                         # tags$br(),

                         # menuItem("Powered by mbb",  href = "http://mbb.univ-montp2.fr/MBB/index.php", newtab = TRUE, icon = icon("book", lib="font-awesome"), selected = NULL),
                         #
                         # menuItem("Team", icon = icon("book", lib="font-awesome"),
                         #          menuItem("Vincent Bonhomme",  href = "http://www.isem.univ-montp2.fr/recherche/equipes/phylogenie-et-evolution-moleculaire/personnel/douzery-emmanuel/", newtab = TRUE,     icon = shiny::icon("male"), selected = NULL  ),
                         #          menuItem("Jimmy Lopez",  href = "http://www.isem.univ-montp2.fr/recherche/les-plate-formes/bioinformatique-labex/personnel/", newtab = TRUE,   icon = shiny::icon("male"), selected = NULL  )
# )


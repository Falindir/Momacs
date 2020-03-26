tabCosmetics = fluidPage(
  box(width = 6,

      h4("Points"),
      sliderInput("sizePoint",
                  "Size", min=0.25, max=5, value=configs$size_point, step=0.25),
      colourInput("colorPoint",
                  "Colour", configs$color_point),

      h4("Segments"),
      sliderInput("sizeSegment",
                  "Width", min=0.25, max=5, value=configs$size_segment, step=0.25),
      colourInput("colorSegment",
                  "Colour", configs$color_segment),

      h4("Curves"),
      sliderInput("sizeCurve",
                  "Width", min=0.25, max=5, value=configs$size_curve, step=0.25),
      colourInput("colorCurves",
                  "Colour", configs$color_curve),

      h4("Text"),
      sliderInput("sizeTexte",
                  "Size", min=0.25, max=5, value=configs$size_text, step=0.25),
      colourInput("colorTextes",
                  "Colour", configs$color_text),

      h4("Background"),
      colourInput("colorBackground",
                  "Colour", configs$color_background),

      h4("Preferences"),
      actionButton("saveSetting",
                   "Save", class="btn btn-primary")

  )
)

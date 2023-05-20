# app/view/plot.R

box::use(
  plotly[plotlyOutput, renderPlotly],
  shiny[moduleServer, NS],
)

box::use(
  app/logic/barchart[generate_barchart],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  plotlyOutput(ns("barchart"))
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$barchart <- renderPlotly({
      generate_barchart(data())
    })
  })
}
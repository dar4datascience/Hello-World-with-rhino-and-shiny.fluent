# app/view/toggle.R

box::use(
  dplyr[filter],
  shiny[div, moduleServer, NS, reactive],
  shiny.fluent[Text, Toggle.shinyInput],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    Toggle.shinyInput(ns("includeOpen"), label = "Include open deals")
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    filtered_deals <- reactive({
      # Datasets are the only case when you need to use :: in `box`.
      # This issue should be solved in the next `box` release.
      shiny.fluent::fluentSalesDeals |> filter(
        is_closed | input$includeOpen
      )
    })
    return(filtered_deals)
  })
}
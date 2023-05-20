#app/main.R
box::use(
  shiny[moduleServer, NS, span],
  shiny.fluent[fluentPage, Stack, Text],
)

box::use(
  app/view/datatable,
  app/view/toggle,
  app/view/plot,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    Text("Sales Data Dashboard", variant = "xxLarge"),
    Text("A randomly generated dataset of imaginary sales deals", variant = "large"),
    toggle$ui(ns("toggle")),
    Stack(
      horizontal = TRUE,
      tokens = list(padding = 20, childrenGap = 10),
      span(class = "ms-depth-8", datatable$ui(ns("datatable"))),
      span(class = "ms-depth-8", plot$ui(ns("plot")))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <-toggle$server("toggle")
    datatable$server("datatable", data)
    plot$server("plot", data)
  })
}
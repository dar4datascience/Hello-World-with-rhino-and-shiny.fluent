# app/view/datatable.R

box::use(
  shiny[moduleServer, NS, reactive, renderUI, uiOutput],
  shiny.fluent[DetailsList],
  tibble[tibble],
)

columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "city", "is_closed"),
  name = c("Sales Rep", "Date", "Deal Amount", "City", "Is Closed?")
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("datatable"))
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$datatable <- renderUI({
      DetailsList(items = data(), columns = columns)
    })
  })
}

library(shiny)
library(bslib)

ui <- page_fluid(
  titlepanel("Padippool")
  card(
    card_header("Settings"),
    "Choose settings..."
  )
  
)

server <- function(input, output) {
  
  test <- "மா"
  
}

shinyApp(ui = ui, server = server)


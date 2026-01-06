#options(shiny.launch.browser = TRUE)
library(shiny)
library(bslib)

ui <- page_fluid(
  titlePanel("Welcome to படிப்pool"),
  card(
    card_header("Options"),
    "Choose question type"
  ),
  
  actionButton("question", "Question\nகேல்வி"),
  
  card(
    "before maa",
    textOutput("question"),
    "after maa"
    )
  

  
)

server <- function(input, output) {
  
  output$question = renderText("Translate:")
  
  test <- "மா"

  observeEvent(input$question, {
    output$question = renderText(paste("Translate:", test))
  })
  
}

shinyApp(ui = ui, server = server)


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
    #"before maa",
    textOutput("question"),
    #"after maa"
    ),
  
  actionButton("solution", "Solution"),
  
  card(
    #"before maa",
    textOutput("solution"),
    #"after maa"
  )
  

  
)

server <- function(input, output) {
  
  output$question = renderText("")
  output$solution = renderText("")
  
  test <- "வணக்கம்"
  test_sol <- "hello" 

  observeEvent(input$question, {
    output$question = renderText(paste("Translate:", test))
  })
  
  observeEvent(input$solution, {
    output$solution = renderText(paste("Our Solution:", test_sol))
  })
}

shinyApp(ui = ui, server = server)


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
  
  qa <- reactiveVal(c("", "")) 
  
  sol <- reactiveVal(c("", ""))
  
  output$question = renderText(qa()[1])
  output$solution = renderText(qa()[2])
  questions <- list(
    c("வணக்கம்", "hello"),
    c("மாடு", "cow")
  )
  
  test <- "வணக்கம்"
  test_sol <- "hello" 

  observeEvent(input$question, {
    selection = sample(questions, 1)[[1]]
    qa(c(selection[1], ""))
    #solution=reactive(paste("Our solution: ", selection[2]))
    #output$question = renderText(question())
    sol(c(selection[1], selection[2]))
  })
  
  observeEvent(input$solution, {
    qa(sol())
  })
}

shinyApp(ui = ui, server = server)


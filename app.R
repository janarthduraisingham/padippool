library(shiny)
library(bslib)

ui <- page_fluid(
  titlePanel("Welcome to படிப்pool"),
  card(
    card_header("Options"),
    "What will you dive into today?"
  ),
  
  
  card(
    textOutput("question"),
    actionButton("question", "Question\nகேல்வி")
    
    ),
  
  card(
    card_header("Your solution"),
    textInput("user_solution", "Enter solution", "")
  ),
  
  
  card(
    textOutput("solution"),
    textOutput("user_sol"),
    textOutput("check_message"),
    actionButton("solution", "Our Solution"),
    
  )
  

  
)

server <- function(input, output) {
  
  set.seed(as.numeric(Sys.time()))
  
  source("R/verbs.R")
  source("R/nouns.R")
  
  rv <- reactiveValues(question_answer = c("", ""),
                       solution = c("", ""),
                       check_message = "")
  
  qa <- reactiveVal(c("", "")) 
  sol <- reactiveVal(c("", ""))
  check <- reactiveVal("")
  
  output$check_message = renderText(rv$check_message)
  output$user_sol<- renderText(input$user_solution)
  output$question = renderText(qa()[1])
  output$solution = renderText(qa()[2])
  
  

  observeEvent(input$question, {
    
    questions = c(nouns,
                  verbs)
    
    selection = sample(questions, 1)[[1]]
    qa(c(selection[1], ""))
    sol(c(selection[1], paste(selection[2], "is one possible solution")))
  })
  
  observeEvent(input$solution, {
    qa(sol())
    
    if (sol()[2] == paste(input$user_solution, "is one possible solution")) {rv$check_message = "Yours is the same!"} else {rv$check_message = "Yours is different"}
    
    
  })
}

shinyApp(ui = ui, server = server)
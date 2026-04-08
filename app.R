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
    textOutput("check"),
    actionButton("solution", "Our Solution"),
    
  )
  

  
)

server <- function(input, output) {
  
  set.seed(as.numeric(Sys.time()))
  
  source("R/verbs.R")
  source("R/nouns.R")
  
  rv <- reactiveValues(question_answer = c("", ""))
  
  qa <- reactiveVal(c("", "")) 
  sol <- reactiveVal(c("", ""))
  check <- reactiveVal("")
  
  output$check = renderText(check())
  output$user_sol<- renderText(input$user_solution)
  output$question = renderText(qa()[1])
  output$solution = renderText(qa()[2])
  
  questions = c(nouns,
                verbs)

  observeEvent(input$question, {
    check("")
    selection = sample(questions, 1)[[1]]
    qa(c(selection[1], ""))
    sol(c(selection[1], paste(selection[2], "is one possible solution")))
  })
  
  observeEvent(input$solution, {
    qa(sol())
    
    if (sol()[2] == paste(input$user_solution, "is one possible solution")) {check("Yours is the same!")} else { check("Yours is different")}
    
  })
}

shinyApp(ui = ui, server = server)
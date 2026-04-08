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
  
  rv <- reactiveValues(question = "",
                       solution = "",
                       solution_message = "",
                       check_message = "")
  
  output$check_message = renderText(rv$check_message)
  output$user_sol<- renderText(input$user_solution)
  output$question = renderText(rv$question)
  output$solution = renderText(rv$solution_message)

  # On button press, randomly select and print question-solution pair
  observeEvent(input$question, {
    
    # First, clear solution printout and check print out
    rv$solution_message = ""
    rv$check_message = ""
    questions = c(nouns,
                  verbs)
    
    # Randomyl draw question-answer pair
    selection = sample(questions, 1)[[1]]
    rv$question = selection[1]
    rv$solution = selection[2]
  })
  
  # On button press, check user input against solution and print message accordingly
  observeEvent(input$solution, {
    rv$solution_message = paste(rv$solution, "is one possible solution")
    
    if (rv$solution == input$user_solution) {rv$check_message = "Yours is the same!"} else {rv$check_message = "Yours is different"}
  })
}

shinyApp(ui = ui, server = server)
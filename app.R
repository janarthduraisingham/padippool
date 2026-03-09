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
  
  card(
    card_header("Your solution"),
    textInput("user_solution", "Enter solution", "")
  ),
  
  actionButton("solution", "Our Solution"),
  
  card(
    #"before maa",
    textOutput("solution"),
    textOutput("user_sol"),
    textOutput("check")
    #"after maa"
  )
  

  
)

server <- function(input, output) {
  
  qa <- reactiveVal(c("", "")) 
  sol <- reactiveVal(c("", ""))
  check <- reactiveVal("")
  
  output$check = renderText(check())
  output$user_sol<- renderText(input$user_solution)
  output$question = renderText(qa()[1])
  output$solution = renderText(qa()[2])
  questions <- list(
    c("hello","வணக்கம்"), 
    c("cow", "மாடு"),
    c("picture; movie", "படம்"),
    c("tooth", "பல்"),
    c("stone", "கல்"),
    c("soil; dirt", "மண்"),
    c("sand", "மணல்"),
    c("son", "மகன்"),
    c("daughter", "மகள்"),
    c("tree", "மரம்"),
    c("sea", "கடல்"),
    c("debt; obligation", "கடன்"),
    c("fruit", "பழம்"),
    c("page; side", "பக்கம்"),
    c("fingernail; toenail", "நகம்"),
    c("mind; willingness", "மனம்"),
    c("smell; scent; wedding", "மணம்"))
  
  test <- "வணக்கம்"
  test_sol <- "hello" 

  observeEvent(input$question, {
    check("")
    selection = sample(questions, 1)[[1]]
    qa(c(selection[1], ""))
    #solution=reactive(paste("Our solution: ", selection[2]))
    #output$question = renderText(question())
    sol(c(selection[1], selection[2]))
  })
  
  observeEvent(input$solution, {
    qa(sol())
    
    if (sol()[2] == input$user_solution) {check("same!")} else { check("different...")}
    
  })
}

shinyApp(ui = ui, server = server)


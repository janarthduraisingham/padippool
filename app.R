library(shiny)
library(bslib)

# Options
options(shiny.fullstacktrace = TRUE)
options(shiny.error = browser)

choices = c(
  "Nouns in the Nominative case" = "nouns_nominative",
  "Nouns in the Accusative case" = "nouns_accusative",
  "Verbs in the informal Imperative tense" = "imperative_verbs_informal",
  "Verbs in the Present tense" = "present_tense_verbs",
  "Verbs in the Perfect Past tense" = "past_tense_verbs",
  "Verbs in the Future tense" = "future_tense_verbs",
  "Verbs in the Negative mood" = "negative_mood_verbs",
  "Numbers" = "numbers",
  "Prepositions" = "prepositions",
  "Interrogatives & demonstratives" = "interrogatives_demonstratives",
  "Adverbs" = "adverbs"
)

ui <- page_fluid(
  titlePanel("Welcome to படிப்pool"),
  card(
    card_header("Acknowledgement"),
    "The contents of this web application is heavily inspired by the following freely available book:", br(),
    span("Kottalam, Jeyapandian.", em("Learning Tamil by Yourself: Classical to Contemporary; Literary to Colloquial."), "Independently published, 2018")
  ),
  card(
    card_header("What will you dive into today?"),
    
    
    
    checkboxGroupInput(
      inputId = "question_types",
      label = "",
      choices = choices,
      selected = choices
    )
  ),
  
  card(
    card_header("Score"),
    textOutput("questions_attempted"),
    textOutput("correct_solutions"),
    textOutput("hit_rate"),
    textOutput("current_streak"),
    textOutput("longest_streak")
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
  
  rv <- reactiveValues(question = "",
                       solution = "",
                       solution_message = "",
                       check_message = "",
                       questions = 0,
                       correct = 0,
                       current_streak = 0,
                       longest_streak = 0,
                       solution_requested = 0)
  
  # Output to ui
  output$check_message = renderText(rv$check_message)
  output$user_sol<- renderText(input$user_solution)
  output$question = renderText(rv$question)
  output$solution = renderText(rv$solution_message)
  
  output$questions_attempted = renderText(paste0("Questions: ", as.character(rv$questions)))
  output$correct_solutions = renderText(paste0("Correct: ", as.character(rv$correct)))
  
  # Deal with NaN hit rate
  output$hit_rate = renderText({
    if (rv$questions == 0) {
      paste0("Hit rate: -")
    } else {
      paste0("Hit rate: ", as.character(round(100 * rv$correct / rv$questions, 2)), "%")
    }
  })
  
  output$current_streak = renderText(paste0("Current streak: ", as.character(rv$current_streak)))
  output$longest_streak = renderText(paste0("Longest streak: ", as.character(rv$longest_streak)))

  # On button press, randomly select and print question-solution pair
  observeEvent(input$question, {
    # Require at least one checkbox ticked
    req(length(input$question_types) >= 1)
    
    # First, clear solution printout and check print out
    rv$solution_message = ""
    rv$check_message = ""
    
    # Incremement questions asked tracker
    rv$questions = rv$questions + 1
    
    # Reset current streak if new question requested before solution
    if (rv$solution_requested == 0){
      rv$current_streak = 0
    }
    
    # Set solution requested flag to 0
    rv$solution_requested = 0
    
    # Select question based on user-selected question type(s)
    questions = c()
    
    for (selection in input$question_types) {
      
      questions = c(questions, get(selection))
      
    }
    
    # Randomly draw question-answer pair
    selection = sample(questions, 1)[[1]]
    rv$question = selection[1]
    rv$solution = selection[2]
  })
  
  # On button press, check user input against solution and print message accordingly
  observeEvent(input$solution, {
    
    # Require at least one checkbox ticked
    req(length(input$question_types) >= 1)
    
    rv$solution_message = paste(rv$solution, "is one possible solution")
    
    if (rv$solution == input$user_solution) {
      rv$check_message = "Yours is the same!"
    } else {
        rv$check_message = "Yours is different"
        rv$current_streak = 0
    }
    
    # Increment correct solutions tracker if this is first button press for question
    
    if (rv$solution_requested == 0 & rv$solution == input$user_solution) {
      
      rv$correct = rv$correct + 1
      rv$current_streak = rv$current_streak + 1
      
      # Update longest streak
      if (rv$current_streak > rv$longest_streak) {
        rv$longest_streak = rv$current_streak
      }
      
    }
    
    # Update flag
    rv$solution_requested = 1
    
  })

}

shinyApp(ui = ui, server = server)
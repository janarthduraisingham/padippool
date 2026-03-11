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
  
  verbs <- list(
    c("", "வா"),
    c("", "தா"),
    c("", "போ"),
    c("", "நட"),
    c("", "ஓடு"),
    c("", "இரு"),
    c("", "தொடு"),
    c("", "வாங்கு"),
    c("", "தூங்கு"),
    c("", "எழுந்திரு"),
    c("", "படு"),
    c("", "சாப்பிடு"),
    c("", "கழுவு"),
    c("", "ஊட்டு"),
    c("", "அழு"),
    c("", "கத்து"),
    c("", "கூப்பிடு"),
    c("", "இழு"),
    c("", "தள்ளு"),
    c("", "பேசு"),
    c("", "பாடு"),
    c("", "வெட்டு"),
    c("", "குளிப்பாடு"),
    c("", "விளையாடு"),
    c("", "குளி"),
    c("", "கடி"),
    c("", "பிழி"),
    c("", "படி"),
    c("", "குடி"),
    c("", "அடி"),
    c("", "குதி"),
    c("", "நில்"),
    c("", "சொல்"),
    c("", "புரிந்துகொள்"),
    c("", "கேள்"),
    c("", "பார்"),
    c("", "உட்கார்"),
    c("", "நனை"),
    c("", "மறை"),
    c("", "கொல்")
    )
  
  nouns <- list(
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
    c("smell; scent; wedding", "மணம்"),
    c("", "மஞ்சல்"),
    c("", "தங்கம்"),
    c("", "இடம்"),
    c("", "உலகம்"),
    c("", "ஊர்"),
    c("", "கிளி"),
    c("", "காகம்"),
    c("", "கால்"),
    c("", "பாதம்"),
    c("", "மாதம்"),
    c("", "நாள்"),
    c("", "மனிதன்"),
    c("", "உதவி"),
    c("", "வழி"),
    c("", "வலி"),
    c("", "வாசல்"),
    c("", "மாணவன்"),
    c("", "மாணவி"),
    c("", "ஆசிரியர்"),
    c("", "ஒன்று"),
    c("", "இரண்டு"),
    c("", "மூன்று"),
    c("", "நான்கு"),
    c("", "ஐந்து"),
    c("", "ஆறு"),
    c("", "ஏழு"),
    c("", "எட்டு"),
    c("", "ஒன்பது"),
    c("", "பத்து"),
    c("", "நூறு"),
    c("", "ஆயிரம்"),
    c("", "முதுகு"),
    c("", "ஆடு"),
    c("", "நூல்"),
    c("", "கூட்டம்"),
    c("", "புத்தகம்"),
    c("", "துண்டு"),
    c("", "உள்ளே"),
    c("", "வெளியே"),
    c("", "மேலே"),
    c("", "கீழே"),
    c("", "மேகம்"),
    c("", "காலை"),
    c("", "மாலை"),
    c("", "கை"),
    c("", "மை"),
    c("", "பை"),
    c("", "வாழை"),
    c("", "சேலை"),
    c("", "பனை"),
    c("", "பானை"),
    c("", "யானை"),
    c("", "குதிரை"),
    c("", "இலை"),
    c("", "வளையல்"),
    c("", "வளைவு"),
    c("", "குழந்தை"),
    c("", "கோடு"),
    c("", "வரி"),
    c("", "தோல்"),
    c("", "தோள்"),
    c("", "மொட்டு"),
    c("", "பூ"),
    c("", "மௌனம்"),
    c("", "வௌவால்"),
    c("", "என்ன"),
    c("", "எவன்"),
    c("", "எவள்"),
    c("", "எவர்"),
    c("", "ஏன்"),
    c("", "எது"),
    c("", "எவை"),
    c("", "எந்த"),
    c("", "அந்த"),
    c("", "இந்த"),
    c("", "எங்கே"),
    c("", "அங்கே"),
    c("", "இங்கே"),
    c("", "எப்போது"),
    c("", "அப்போது"),
    c("", "இப்போது"),
    c("", "எப்படி"),
    c("", "இப்படி"),
    c("", "எத்தனை"),
    c("", "இவ்வளவு"),
    c("", "எதற்கு"),
    c("", "அதற்கு"),
    c("", "என்று"),
    c("", "அன்று"),
    c("", "நேற்று"),
    c("", "இன்று"),
    c("", "நாளை")
  )
    
  questions = c(nouns,
                verbs)
  
  test <- "வணக்கம்"
  test_sol <- "hello" 

  observeEvent(input$question, {
    check("")
    selection = sample(questions, 1)[[1]]
    qa(c(selection[1], ""))
    #solution=reactive(paste("Our solution: ", selection[2]))
    #output$question = renderText(question())
    sol(c(selection[1], paste(selection[2], "is our solution")))
  })
  
  observeEvent(input$solution, {
    qa(sol())
    
    if (sol()[2] == input$user_solution) {check("Yours is the same!")} else { check("Yours is different")}
    
  })
}

shinyApp(ui = ui, server = server)


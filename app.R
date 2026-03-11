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
    c("come; welcome", "வா"),
    c("give (me)", "தா"),
    c("go", "போ"),
    c("walk; happen", "நட"),
    c("run; shell (n)", "ஓடு"),
    c("sit; stay; be", "இரு"),
    c("give (to someone)", "தொடு"),
    c("buy", "வாங்கு"),
    c("sleep", "தூங்கு"),
    c("get up; wake up", "எழுந்திரு"),
    c("lie down", "படு"),
    c("eat", "சாப்பிடு"),
    c("wash", "கழுவு"),
    c("feed (a baby)", "ஊட்டு"),
    c("cry; weep", "அழு"),
    c("cry; shout", "கத்து"),
    c("call; invite", "கூப்பிடு"),
    c("pull", "இழு"),
    c("push", "தள்ளு"),
    c("speak", "பேசு"),
    c("sing", "பாடு"),
    c("cut", "வெட்டு"),
    c("bathe (a baby)", "குளிப்பாடு"),
    c("play", "விளையாடு"),
    c("bathe", "குளி"),
    c("bite", "கடி"),
    c("squeeze", "பிழி"),
    c("read; step(n)", "படி"),
    c("drink", "குடி"),
    c("strike; hit; bottom", "அடி"),
    c("jump", "குதி"),
    c("stop; stand", "நில்"),
    c("say; tell", "சொல்"),
    c("understand", "புரிந்துகொள்"),
    c("hear; listen", "கேள்"),
    c("see; look", "பார்"),
    c("sit", "உட்கார்"),
    c("wet (vb)", "நனை"),
    c("hide", "மறை"),
    c("kill", "கொல்")
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
    c("turmeric; yellow", "மஞ்சல்"),
    c("gold", "தங்கம்"),
    c("place; location", "இடம்"),
    c("world", "உலகம்"),
    c("village; city", "ஊர்"),
    c("parrot", "கிளி"),
    c("crow", "காகம்"),
    c("leg; quarter", "கால்"),
    c("foot (body part)", "பாதம்"),
    c("month", "மாதம்"),
    c("day", "நாள்"),
    c("man", "மனிதன்"),
    c("help", "உதவி"),
    c("path; way", "வழி"),
    c("pain; discomfort", "வலி"),
    c("entrance", "வாசல்"),
    c("student (male)", "மாணவன்"),
    c("student (female)", "மாணவி"),
    c("teacher", "ஆசிரியர்"),
    c("one", "ஒன்று"),
    c("two", "இரண்டு"),
    c("three", "மூன்று"),
    c("four", "நான்கு"),
    c("five", "ஐந்து"),
    c("six", "ஆறு"),
    c("seven", "ஏழு"),
    c("eight", "எட்டு"),
    c("nine", "ஒன்பது"),
    c("ten", "பத்து"),
    c("hundred", "நூறு"),
    c("thousand", "ஆயிரம்"),
    c("back (spine)", "முதுகு"),
    c("goat; to rock; to dance", "ஆடு"),
    c("thread; book", "நூல்"),
    c("crowd", "கூட்டம்"),
    c("book", "புத்தகம்"),
    c("piece; towel", "துண்டு"),
    c("inside", "உள்ளே"),
    c("outside", "வெளியே"),
    c("above; up", "மேலே"),
    c("below; down", "கீழே"),
    c("cloud", "மேகம்"),
    c("morning", "காலை"),
    c("evening; afternoon; garland", "மாலை"),
    c("hand", "கை"),
    c("ink; mascara", "மை"),
    c("bag", "பை"),
    c("banana", "வாழை"),
    c("sari", "சேலை"),
    c("palm tree", "பனை"),
    c("pot", "பானை"),
    c("elephant", "யானை"),
    c("horse", "குதிரை"),
    c("leaf", "இலை"),
    c("bracelet", "வளையல்"),
    c("bend", "வளைவு"),
    c("baby; child", "குழந்தை"),
    c("drawn line", "கோடு"),
    c("written line; tax", "வரி"),
    c("skin; peel", "தோல்"),
    c("shoulder", "தோள்"),
    c("bud", "மொட்டு"),
    c("flower", "பூ"),
    c("silence", "மௌனம்"),
    c("bat (animal)", "வௌவால்"),
    c("what", "என்ன"),
    c("who (male)", "எவன்"),
    c("who (female)", "எவள்"),
    c("who (pl/ formal)", "எவர்"),
    c("why", "ஏன்"),
    c("which (sg)", "எது"),
    c("which (pl)", "எவை"),
    c("which (of many)", "எந்த"),
    c("that", "அந்த"),
    c("this", "இந்த"),
    c("where", "எங்கே"),
    c("there", "அங்கே"),
    c("here", "இங்கே"),
    c("when", "எப்போது"),
    c("then", "அப்போது"),
    c("now", "இப்போது"),
    c("how", "எப்படி"),
    c("this way", "இப்படி"),
    c("how many", "எத்தனை"),
    c("this much", "இவ்வளவு"),
    c("for what", "எதற்கு"),
    c("for that", "அதற்கு"),
    c("which day", "என்று"),
    c("that day", "அன்று"),
    c("yesterday", "நேற்று"),
    c("today", "இன்று"),
    c("tomorrow", "நாளை")
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


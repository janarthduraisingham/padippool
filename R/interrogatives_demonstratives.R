interrogatives_demonstratives <- function() {
  list(
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
  c("which day", "என்று")
) %>%
  map(~ {
    .x[1] = paste0("[Interrogatives & Demonstratives] ", .x[1]) # prepend question type
    .x
  })
}
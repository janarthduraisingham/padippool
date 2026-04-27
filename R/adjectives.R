adjectives <- function() {
  list(
  c("previous", "முந்திய"),
  c("next", "அடுத்த"),
  c("flat", "தட்டை"),
  c("round; spherical", "உருண்டை"),
  c("suitable", "தகுந்த")
) %>%
  map(~ {
    .x[1] = paste0("[Adjectives] ", .x[1]) # prepend question type
    .x
  })
  
}
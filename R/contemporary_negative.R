contemporary_negatives <- function() {
  list(
  c("he will not come", "அவர் வரமாட்டார்"),
  c("they will not do", "அவர்கள் செய்யமாட்டார்கள்"),
  c("did not do", "செய்யவில்லை"),
  c("did not walk", "நடக்கவில்லை")
) %>%
  map(~ {
    .x[1] = paste0("[Adjectives] ", .x[1]) # prepend question type
    .x
  })
  
}
contemporary_negative <- function() {
  list(
  c("he will not come", ),
  c("they will not do", ),
  c("did not do", ""),
  c("did not walk", "")
) %>%
  map(~ {
    .x[1] = paste0("[Adjectives] ", .x[1]) # prepend question type
    .x
  })
  
}
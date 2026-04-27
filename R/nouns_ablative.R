nouns_ablative <- function() {
  list(
  c("He is coming from home", "வீட்டிலிருந்து வருக்றான்")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Ablative case] ", .x[1]) # prepend question type
    .x
  })
}
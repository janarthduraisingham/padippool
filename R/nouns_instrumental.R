nouns_instrumental <- list(
  c("He cut with knife", "கத்தியால் வெட்டினான்"),
  c("He wrote with hand", "கையால் எழுதினான்")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Instrumental case] ", .x[1]) # prepend question type
    .x
  })
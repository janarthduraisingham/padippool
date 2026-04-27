nouns_genitive <- function() {
  list(
  c("Rama's hand", "ராமனின் கை"),
  c("India's capital is Delhi, (dilli)", "இந்தியாவின் தலைநகரம் டில்லி"),
  c("Rama's book is in his house", "ராமனின் புத்தகம் அவனின் வீட்டில் இருக்கிறது")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Genitive case] ", .x[1]) # prepend question type
    .x
  })
}

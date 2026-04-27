nouns_locative <- function() {
  list(
  c("Book is in the house", "புத்தகம் வீட்டில் இருக்கிறது"),
  c("Book is on the table", "புத்தகம் மேஜைமேல் இருக்கிறது"),
  c("Book is with him", "பத்தகம் அவனிடம் இருக்கிளது")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Locative case] ", .x[1]) # prepend question type
    .x
  })
}
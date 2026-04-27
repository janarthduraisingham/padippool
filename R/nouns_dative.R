nouns_dative <- list(
  c("He went home", "வீட்டுக்குப் போனான்"),
  c("Cow has four legs ", "மாட்டுக்கு நான்கு கால்கள்"),
  c("He went to Chennai", "ஞென்னைக்குப் போனான்"),
  c("Train will go to Mumbai", "வண்டி மும்பைக்குப் போகும்"),
  c("He put grass to the cow", "புல்லை மாட்டினுக்குப் போட்டான்")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Dative case] ", .x[1]) # prepend question type
    .x
  })
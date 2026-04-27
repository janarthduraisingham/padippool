numbers <- list(
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
  c("one hundred", "நூறு"),
  c("one thousand", "ஆயிரம்")
) %>%
  map(~ {
    .x[1] = paste0("[Numbers] ", .x[1]) # prepend question type
    .x
  })
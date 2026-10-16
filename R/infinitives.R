infinitives <- function() {
  list(
  c("We are going to play", "விளையாடப் போகிறோம்"),
  c("He said to go", "போகச் சொன்னார்"),
  c("Tell him to stay", "அவரை இருக்கச் சொல்லுங்கோ"),
  c("He told me to stay", "அவர் என்னை இருக்கச் சொன்னார்"),
  c("Put the baby to sleep", "குழந்தையை தூங்கவ்  வையுங்கோ"),
  c("Feed him", "அவரைச் சாப்பிடச் செய்யுங்கோ")
) %>%
  map(~ {
    .x[1] = paste0("[Infinitives] ", .x[1]) # prepend question type
    .x
  })
}
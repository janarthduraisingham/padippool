numbers <- function() {
  list(
  c("We are going to play", ""),
  c("He said to go", ""),
  c("Tell him to stay", ""),
  c("He told me to stay", ""),
  c("Put the baby to sleep", ""),
  c("Feed him", "")
) %>%
  map(~ {
    .x[1] = paste0("[Infinitives] ", .x[1]) # prepend question type
    .x
  })
}
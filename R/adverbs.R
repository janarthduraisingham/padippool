adverbs <- function() {
  list(
  c("slowly", "மெதுவாக")
) %>%
  map(~ {
    .x[1] = paste0("[Adverbs] ", .x[1]) # prepend question type
    .x
  })
}
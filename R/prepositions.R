prepositions <- list(
  c("inside", "உள்ளே"),
  c("outside", "வெளியே"),
  c("above; up", "மேலே"),
  c("below; down", "கீழே")
) %>%
  map(~ {
    .x[1] = paste0("[Prepositions] ", .x[1]) # prepend question type
    .x
  })
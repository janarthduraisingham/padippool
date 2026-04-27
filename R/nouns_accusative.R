nouns_accusative <- list(
  c("dog chased cat", "நாய் பூனையை விரட்டியது"),
  c("cat drank milk", "பூனை பாலைக் குடித்தது"),
  c("he (informal) pushed wagon", "அவன் வண்டியைத் தள்ளினான்"),
  c("tree hides elephant", "மரம் யானையை மறைக்கிறது"),
  c("Kumaran opened door", "குமரன் கதவைத் திறந்தான்")
) %>%
  map(~ {
    .x[1] = paste0("[Nouns in the Accusative case] ", .x[1]) # prepend question type
    .x
  })
pronouns <- function() {
  list(
  c("I", "நான்"),
  c("we (including addressee)", "நாம்"),
  c("we (excluding addressee)", "நாங்கள்"),
  c("you (nominative, informal)", "நீ"),
  c("you (nominative, plural)", "நீங்கள்"),
  c("my", "என்"),
  c("our (excluding addressee)", "எங்கள்"),
  c("our (including addressee)", "நம்"),
  c("your (informal)", "உன்"),
  c("your (plural)", "உங்கள்"),
  c("me", "என்னை"),
  c("us", "எங்களை"),
  c("you (accusative, informal) ", "உன்னை"),
  c("you (accusative, plural)", "உங்களை"),
  c("to me", "எனக்கு"),
  c("to you (plural)", "உங்களுக்கு"),
  c("by (with) me", "என்னிடம்"),
  c("(done) by me", "என்னால்"),
  c("on me", "என்மேல்"),
  c("country", "நாடு"),
  c("mine", "எனது"),
  c("yours (informal)", "உன்னது"),
  c("yours (plural)", "உங்களது"),
  c("(it is) his", "அவனது"),
  c("(it is) theirs (people's)", "அவர்களது"),
  c("(it is) theirs (objects')", "அவற்றுடையது"),
  c("the book is with me", "புத்தகம் என்னிடம் இருக்கிறது"),
  c("the pen is in your (informal) hand", "உன் கையில் பேனா இருக்கிறது"),
  c("where is my pen?", "என் பேனா எங்கே இருக்கிறது"),
  c("is your (informal) book with him?", "உன் புத்தகம் அவனிடமா இருக்கிறது"),
  c("its legs", "அவற்றின் கால்கள்")
) %>%
  map(~ {
    .x[1] = paste0("[Pronouns] ", .x[1]) # prepend question type
    .x
  })
}
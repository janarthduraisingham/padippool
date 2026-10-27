modal_verbs <- function() {
  list(
  c("may do", "செய்யலாம்"),
  c("should do", "செய்ய வேண்டும்"),
  c("let do", "செய்யட்டும்"),
  c("today it may rain", "இன்று மழை பெய்யலாம்"),
  c("you (informal) may go", "நீ போகலாம்"),
  c("what do you (informal) want?", "உனக்கு என்ன வேண்டும்"),
  c("I want food", "எனக்கு சாப்பாடு வேண்டும்"),
  c("Where do you (informal) want to go / Where should you (informal) go?", "நீ எங்கே போக வேண்டும்"),
  c("I want to go to school", "நான் பள்ளிக்கூடம் போக வேண்டும்"),
  c("You (informal) should go to school", "நீ பள்ளிக்கூடம் போக வேண்டும்"),
  c("The vehicle should come now", "இப்போது வாகணம் வர வேண்டும்"),
  c("Let him (informal) go to school", "அவன் பள்ளிக்கூடம் போகட்டும்"),
  c("Let it rain", "மழை பெய்யட்டும்"),
  c("Let the vehicle stop; we can board", "வாகணம் நிற்கட்டும் ஏறலாம்"),
  c("Let it happen; we can see", "ஆகட்டும் பார்க்கலாம்"),
  c("He (informal) can do it", "அவனால் அதைச் செய்ய இயலும்"),
  c("He (informal) cannot do it", "அவனால் அதைச் செய்ய இயலாது"),
  c("I cannot walk", "என்னால் நடக்க இயலாது"),
  c("He (informal) can do it (contemporary)", "அவனால் அதைச் செய்ய முடியும்"),
  c("He (informal) cannot do it (contemporary)", "அவனால் அதைச் செய்ய முடியாது"),
  c("One must not do it", "அதைச் செய்யக் கூடாது"),
  c("One must not go there", "அங்கு போகக் கூடாது"),
  c("Do not go there", "அங்கு போகாதே"),
  c("Need not", "வேண்டாம்"),
  c("Tell him (informal) to eat", "அவனைச் சாப்பிடச் சொல்லுங்கோ"),
  c("He called to come (invited) to the house", "வீட்டுக்கு வர அழைத்தார்"),
  c("Today they won't play", "இன்று விளையாடமாட்டார்கள்"),
  c("Can I go there?", "ரான் அங்கு போகலாமா"),
  c("Today rain didn't fall", "இன்று மழை பெய்யவில்லை"),
  c("One can't bite the candy", "மிட்டாயைக் கடிக்க இயலாது")
) %>%
  map(~ {
    .x[1] = paste0("[Adjectives] ", .x[1]) # prepend question type
    .x
  })
  
}
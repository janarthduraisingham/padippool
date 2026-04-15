library(tidyverse)
library(purrr)

imperative_verbs_informal <- list(
  c("come; welcome", "வா"),
  c("give (me)", "தா"),
  c("go", "போ"),
  c("walk; happen", "நட"),
  c("run", "ஓடு"),
  c("rock; dance", "ஆடு"),
  c("sit; stay; be", "இரு"),
  c("give (to someone)", "தொடு"),
  c("buy", "வாங்கு"),
  c("sleep", "தூங்கு"),
  c("get up; wake up", "எழுந்திரு"),
  c("lie down", "படு"),
  c("eat", "சாப்பிடு"),
  c("wash", "கழுவு"),
  c("feed (a baby)", "ஊட்டு"),
  c("cry; weep", "அழு"),
  c("cry; shout", "கத்து"),
  c("call; invite", "கூப்பிடு"),
  c("pull", "இழு"),
  c("push", "தள்ளு"),
  c("speak", "பேசு"),
  c("sing", "பாடு"),
  c("cut", "வெட்டு"),
  c("bathe (a baby)", "குளிப்பாடு"),
  c("play", "விளையாடு"),
  c("bend", "வளைவு"),
  c("bathe", "குளி"),
  c("bite", "கடி"),
  c("squeeze", "பிழி"),
  c("read", "படி"),
  c("drink", "குடி"),
  c("strike; hit", "அடி"),
  c("jump", "குதி"),
  c("stop; stand", "நில்"),
  c("say; tell", "சொல்"),
  c("understand", "புரிந்துகொள்"),
  c("hear; listen", "கேள்"),
  c("see; look", "பார்"),
  c("sit", "உட்கார்"),
  c("wet", "நனை"),
  c("hide", "மறை"),
  c("kill", "கொல்"),
  c("stab", "குத்து"),
  c("open", "திற"),
  c("close", "மூடு"),
  c("drop", "போடு"),
  c("chase", "விரட்டு"),
  c("cut", "வெட்டு"),
  c("sharpen; paint", "தீட்டு")
) %>%
  # append informal to english definition
  map(~ {
    .x[1] = paste0(.x[1], " (informal)")
    .x
  })
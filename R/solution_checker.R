library(tidyverse)

# This function accepts and response and solution and returns 'correct' if all
# the words from the solution feature in the response, and 'incorrect' otherwise

response <- "b a c"
solution <- "a b c"

response_split <- str_split(response, pattern = " ")
solution_split <- str_split(solution, pattern = " ")



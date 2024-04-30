library(tidyverse)
library(httr)
library(furrr)
library(future)
library(here)


# download literature tsv file from GBIF
url <- "https://api.gbif.org/v1/literature/export?format=TSV"

literature <- read_tsv(url)


# Set up parallel processing to run multiple requests in parallel
plan(multisession)


# Function to fetch relevance using GBIF API
fetch_relevance <- function(uuid) {
  # Construct the API URL
  api_url <- paste0("https://api.gbif.org/v1/literature/", uuid)
  
  # Make the API request
  response <- httr::GET(api_url)
  
  # Check if the request was successful
  if (response$status_code == 200) {
    # Extract the relevance value from the response
    content_data <- httr::content(response)
    
    # If relevance field is a list, concatenate its elements into a single string
    if (is.list(content_data$relevance)) {
      relevance <- paste(content_data$relevance, collapse = " | ")
    } else {
      # If relevance field is not a list, convert it to character
      relevance <- as.character(content_data$relevance)
    }
    
    return(relevance)
  } else {
    # Return empty string if request failed
    return("")
  }
}

# Use parallel processing to fetch relevance for each UUID
data <- future_map_chr(literature$id, fetch_relevance, .progress = TRUE)


# append relevance to the literature table
lit_relevance <- literature %>% mutate(relevance = data)


# write data frame with relevance into tsv file
current_date <- format(Sys.Date(), "%Y-%m-%d")

out_file <- paste0(current_date, "_gbif-literature-with-relevance", ".txt")

write_tsv(lit_relevance, here("files", out_file), na = "")

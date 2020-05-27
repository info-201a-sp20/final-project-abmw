library(dplyr)
  # Data frame
  df <- read.csv("../data/coffee_df.csv", stringsAsFactors = FALSE)
  ## Summary Information on Global Coffee Insights
  ## total number of countries that produced coffee
  country_prod <- df %>%
    filter(Market_Year == 2019) %>%
    filter(Production != 0) %>%
    nrow()
  ##total number of Arabica coffee produced in 2019
  new_df <- df %>%
    filter(Market_Year == 2019)
  bean_import <- sum(new_df$Bean.Imports, na.rm=TRUE)
library(dplyr)
  # Data frame
summ_info <- function(df) {
  ##df <- read.csv("../data/coffee_df.csv", stringsAsFactors = FALSE)
## Summary Information on Global Coffee Insights
    ## total number of countries that produced coffee
  country_prod <- df %>%
    filter(Market_Year == 2019) %>%
    filter(Production != 0) %>%
    nrow()
  ##total number of beans imported in 2019, measured in 60kg bags.
  new_df <- df %>%
    filter(Market_Year == 2019)
  bean_import <- sum(new_df$Bean.Imports, na.rm=TRUE)
  
  ## total number of beans exported
   df %>%
    filter(Market_Year == 2019)
  bean_export <- sum(new_df$Bean.Exports, na.rm=TRUE)
  
  ## arabica production 
  df %>%
    filter(Market_Year == 2019)
  arabica <- sum(new_df$Arabica.Production, na.rm=TRUE)
  
  ## the total domestic consumption
  df %>%
    filter(Market_Year == 2019)
  dom_con <- sum(new_df$Domestic.Consumption, na.rm=TRUE)
  info_list <- list(bean_export, bean_import, country_prod, dom_con, arabica)
  return(info_list)
}

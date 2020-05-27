## Summary Information on Global Coffee Insights
## total number of countries that produced coffee
country_prod <- (coffee_df) %>%
  filter(Market_Year == 2019) %>%
  nrow()
##total number of Arabica coffee produced in 2019
bean_imports <- coffee_df %>%
  (coffee_df) %>%
  filter(Market_Year == 2019) %>%
  sum("Bean Imports")


    

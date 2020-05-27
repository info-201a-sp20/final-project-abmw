## Summary Information on Global Coffee Insights
get_sum_info <- function(df) {
  coffee_df <- df
  (select(df, 
          "Country_Name", "Bean.Exports", "Bean.Imports", "Domestic.Consumption","Total.Distribution"))
  return(list(summarize(coffee_df)))
}
  

    

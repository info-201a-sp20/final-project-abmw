summ_table <- function(df) {
  coffee_df <- df %>%
    filter(Market_Year == 2019) %>%
  select(Country_Name, Bean.Exports, Bean.Imports, Domestic.Consumption)
    
  

colnames(coffee_df)[colnames(coffee_df)=="Country_name"] <- "Country Name"
colnames(coffee_df)[colnames(coffee_df)=="Bean.Imports"] <- "Bean Imports"
colnames(coffee_df)[colnames(coffee_df)=="Bean.Exports"] <- "Bean Exports"
colnames(coffee_df)[colnames(coffee_df)=="Domestic.Consumption"] <- "Domestic Consumption"
return(coffee_df)
}

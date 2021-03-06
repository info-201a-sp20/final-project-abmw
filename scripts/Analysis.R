library(dplyr)
library(tidyr)
library(leaflet)
library(htmltools)
library(plotly)
library(ggplot2)
library(stringr)
# Data frame
raw_df <- read.csv("../data/USDA.csv", stringsAsFactors = FALSE)
# Data frame
# Value = (1000 60 KG BAGS)
coffee_df <- raw_df %>%
  group_by(Attribute_Description) %>%
  filter(Value != 0) %>%
  select(Country_Name, Market_Year, Attribute_Description, Value) %>%
  spread(Attribute_Description, Value) %>%
  replace(is.na(.), 0)

#write new
write.csv(coffee_df, "..\\data\\coffee_df.csv", row.names = FALSE)

# CONSUMPTION DATAFRAME
# make country names match
fix_names <- function(col) {
  col <- col %>%
    str_replace("Congo (Brazzaville)", "Congo") %>%
    str_replace("Congo (Kinshasa)", "Congo, Democratic Republic of the") %>%
    str_replace("Congo, Rep.", "Congo") %>%
    str_replace("Congo, Dem. Rep.", "Congo, Democratic Republic of the") %>%
    str_replace("Egypt, Arab Rep.", "Egypt") %>%
    str_replace("Iran, Islamic Rep.", "Iran") %>%
    str_replace("Korea, Rep.", "South Korea") %>%
    str_replace("Lao PDR", "Laos") %>%
    str_replace("Russia", "Russian Federation") %>%
    str_replace("Venezuela, RB", "Venezuela") %>%
    str_replace("Yemen, Rep.", "Yemen")
  return(col)
}

# shape population data frame
pop_df <- read.csv("../data/populationdataworldbank.csv",
                   stringsAsFactors = F)

pop_df <- pop_df %>%
  select(-Indicator.Code, -Indicator.Name, -X2019) %>%
  gather(key = "Year", value = "Population", -�..Country.Name, -Country.Code)

pop_df$Year <- pop_df %>%
  pull("Year") %>%
  str_remove("X") %>%
  as.numeric()

pop_df$�..Country.Name <- sapply(pop_df$�..Country.Name, fix_names)

# shape consumption data frame
consumption_df <- read.csv("../data/coffee_df.csv",
                           stringsAsFactors = F) %>%
  select(Country_Name, Market_Year, Domestic.Consumption)

consumption_df$Country_Name <- sapply(consumption_df$Country_Name, fix_names)

# join consumption and population data frames
joined <- left_join(consumption_df, pop_df,
                    by = c("Country_Name" = "�..Country.Name",
                           "Market_Year" = "Year")) %>%
  filter(Market_Year < 2019) %>%
  mutate(Consumption.per.Capita = (Domestic.Consumption / Population) * 1000)

# write
write.csv(joined, file = "../data/dom_consumption_df.csv", row.names = F)

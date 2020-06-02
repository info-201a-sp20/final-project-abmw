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
# make country names match world map data frame
fix_names <- function(col) {
  col <- col %>%
    str_replace("Congo (Brazzaville)", "Congo") %>%
    str_replace("Congo (Kinshasa)", "Congo, Democratic Republic of the") %>%
    str_replace("United States", "United States of America") %>%
    str_replace("Congo, Rep.", "Congo") %>%
    str_replace("Congo, Dem. Rep.", "Congo, Democratic Republic of the") %>%
    str_replace("Egypt, Arab Rep.", "Egypt") %>%
    str_replace("Iran, Islamic Rep.", "Iran (Islamic Republic of)") %>%
    str_replace("Iran", "Iran (Islamic Republic of)") %>%
    str_replace("Korea, Rep.", "Korea, Republic of") %>%
    str_replace("South Korea", "Korea, Republic of") %>%
    str_replace("Lao PDR", "Lao People's Democratic Republic") %>%
    str_replace("Laos", "Lao People's Democratic Republic") %>%
    str_replace("Russia", "Russian Federation") %>%
    str_replace("Venezuela, RB", "Venezuela") %>%
    str_replace("Yemen, Rep.", "Yemen") %>%
    str_replace("CÃ´te d'Ivoire", "Cote d'Ivoire") %>%
    str_replace("Taiwan", "Taiwan, Province of China") %>%
    str_replace("Tanzania", "Tanzania, United Republic of") %>%
    str_replace("Venezuela", "Venezuela (Bolivarian Republic of)") %>%
    str_replace("Vietnam", "Viet Nam")
  return(col)
}

# shape population data frame
pop_df <- read.csv("../data/populationdataworldbank.csv",
                   stringsAsFactors = F)

pop_df <- pop_df %>%
  select(-Country.Code, -Indicator.Code, -Indicator.Name, -X2019) %>%
  gather(key = "Year", value = "Population", -ï..Country.Name)

pop_df$Year <- pop_df %>%
  pull("Year") %>%
  str_remove("X") %>%
  as.numeric()

pop_df$ï..Country.Name <- sapply(pop_df$ï..Country.Name, fix_names)

# shape consumption data frame
consumption_df <- read.csv("../data/coffee_df.csv",
                           stringsAsFactors = F) %>%
  select(Country_Name, Market_Year, Domestic.Consumption)

consumption_df$Country_Name <- sapply(consumption_df$Country_Name, fix_names)

# join consumption and population data frames
joined <- left_join(consumption_df, pop_df,
                    by = c("Country_Name" = "ï..Country.Name",
                           "Market_Year" = "Year")) %>%
  filter(Market_Year < 2019) %>%
  mutate(Consumption.per.Capita = (Domestic.Consumption / Population) * 1000)

# add country codes
codes <- read.csv("../data/country_codes.csv", stringsAsFactors = F) %>%
  select(name, alpha.3)

codes$name <- sapply(codes$name, fix_names)

joined <- left_join(joined, codes, by = c("Country_Name" = "name"))

# write
write.csv(joined, file = "../data/dom_consumption_df.csv", row.names = F)

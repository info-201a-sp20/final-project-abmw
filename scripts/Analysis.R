library(dplyr)
library(tidyr)
library(leaflet)
library(htmltools)
library(plotly)
library(ggplot2)
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
write.csv(coffee_df,"..\\data\\coffee_df.csv", row.names = FALSE)

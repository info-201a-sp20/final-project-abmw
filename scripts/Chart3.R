library(dplyr)
library(tidyr)
library(leaflet)
library(htmltools)
library(plotly)
library(ggplot2)
#data frame
coffee_df <- read.csv("../data/coffee_df.csv", stringsAsFactors = FALSE)
#
# Value = (1000 60 KG BAGS)
#
year_production_df <- coffee_df %>%
  group_by(Market_Year) %>%
  summarize(Production = sum(Production)) %>%
  arrange(Production)
#Graph
year_global_production <- plot_ly(
  x = year_production_df$Market_Year,
  y = year_production_df$Production,
  type = "scatter",
  mode = 'lines+markers'
) %>%
  layout(
    title = "Global Production of Coffee by year",
    xaxis = list(title = "Market Year"),
    yaxis = list(title = "Coffee (1000 60 KG BAGS)")
  )
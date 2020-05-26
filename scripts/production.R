library(dplyr)
library(tidyr)
library(leaflet)
library(htmltools)
library(plotly)
library(ggplot2)
#data frame#
product_year_f <- function(df) {
  #
  # Value = (1000 60 KG BAGS)
  #year, global production
  year_production_df <- df %>%
    group_by(Market_Year) %>%
    summarize(Production = sum(Production)) %>%
    filter(Market_Year != 1960) %>%
    filter(Market_Year != 2020) %>%
    arrange(Market_Year)
  #year, leading producer
  country_production_df <- df %>%
    group_by(Market_Year) %>%
    slice(which.max(Production)) %>%
    group_by(Market_Year) %>%
    summarize(Country = Country_Name) %>%
    filter(Market_Year != 1960) %>%
    filter(Market_Year != 2020) %>%
    bind_cols(year_production_df) %>%
    arrange(Market_Year)
  #Graph
  graph_product <- plot_ly(
    x = year_production_df$Market_Year,
    y = year_production_df$Production,
    type = "scatter",
    mode = 'lines+markers'
  ) %>%
    layout(
      title = "Global Production of Coffee by year",
      xaxis = list(title = "Market Year"),
      yaxis = list(title = "Coffee (1000 X 60 KG BAGS)")
    )
  return(graph_product)
}
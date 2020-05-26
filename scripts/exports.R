library(dplyr)
library(tidyr)
library(leaflet)
library(htmltools)
library(plotly)
library(ggplot2)

#Data Frame
create_exports_chart <- function(df) {
  exports <- df %>%
    select(Market_Year,
           Exports,
           Soluble.Exports,
           Country_Name) %>%
    filter(Market_Year == 2019 | 2018 | 2017 |
             2016 | 2015 | 2014 | 2013 | 2012 | 2010) %>%
    top_n(150, wt = Exports)
  #Chart
  chart <- ggplot(data = exports) +
    geom_col(
      mapping = aes(x = Country_Name, y = Exports),
      color = "blue"
    ) +
    labs(title =
           "Exports of Coffee (by The Top Five Countries) Over the Past Ten Years")
  return(chart)
}


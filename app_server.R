# Final-project-abmw app server script
library("dplyr")
library("plotly")
library("tidyr")
library("stringr")
library("ggplot2")

server <- function(input, output) {
  dom_consumption_df <- read.csv(
    "data/dom_consumption_df.csv", stringsAsFactors = F)
  output$map <- renderPlotly({
    dom_consumption_df <- dom_consumption_df %>%
      filter(Market_Year == input$year)

    map <- plot_ly(dom_consumption_df, type = "choropleth",
                   locations = dom_consumption_df$Country.Code,
                   z = dom_consumption_df$Consumption.per.Capita,
                   text = paste(dom_consumption_df$Country_Name),
                   colorscale = "Browns") %>%
      layout(title = "Domestic Consumption per Capita") %>%
      colorbar(title = "Average Consumption per Person \n(in 60kg bags)")
    return(map)
  })

  house_df <- read.csv(
    "data/World Bank household consumption.csv", stringsAsFactors = FALSE,
    fileEncoding = "UTF-8-BOM")
  output$barchart <- renderPlotly({
    household_df <- house_df %>%
      filter(Consumption.Segment == "All") %>%
      filter(Measure.Names == "US$") %>%
      filter(Area != "National") %>%
      filter(Country == input$country_one | Country == input$country_two)
    barchart <- ggplot(household_df) +
      geom_col(mapping = aes(x = Country, y = Measure.Values, fill = Area),
               position = "dodge")

    barchart <- ggplotly(barchart) %>%
      layout(title = "Comparison of Rural and Urban Household Coffee
             Consumption by Country",
             yaxis = list(title = "US$ (Million)")) %>%
      colorbar(title = "Area Type") %>%
      layout(
        margin = list(t = 50)
      )
    return(barchart)
  })

  df <- read.csv(
    "data/coffee_df.csv", stringsAsFactors = F)
  output$line <- renderPlotly({
    year_production_df <- df %>%
      select(Country_Name, Market_Year, Production) %>%
      spread(Country_Name, Production) %>%
      filter(Market_Year < 2020)
    year_production_df$Global <- apply(year_production_df[, -1], 1,
                                      sum, na.rm = TRUE)
    year_production_df <- year_production_df %>%
      select(Market_Year, input$Country)
    colnames(year_production_df) <- c("Year", "Place")

    line <- plot_ly(
      year_production_df,
      x = ~Year,
      y = ~Place,
      type = "scatter",
      mode = "lines+markers"
    ) %>%
      layout(
        title = "Total Production of Coffee by year",
        xaxis = list(title = "Market Year"),
        yaxis = list(title = "Coffee (1000 X 60 KG BAGS)")
      )
    return(line)
  })
}

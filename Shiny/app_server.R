# Final-project-abmw app server script
library("dplyr")
library("plotly")
library("tidyr")
library("stringr")
library("ggplot2")




server <- function(input, output) {
  dom_consumption_df <- read.csv(
    "../data/dom_consumption_df.csv", stringsAsFactors = F)
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
  
  household_df <- read.csv(
    "../data/World Bank household consumption.csv",stringsAsFactors = FALSE)
  output$barchart <- renderPlotly({
    household_df <- filter(household_df, Consumption.Segment == "All", Measure.Names == "US$",
             Area != "National", Country == input$country_one | input$country_two)

    barchart <- ggplot(household_df) +
      geom_col(mapping = aes(x = Country, y = Measure.Values, fill = Area), 
               position = "dodge")
      
    barchart <- ggplotly(barchart) %>%
      layout(title = "Comparison of Rural and Urban Household Coffee Consumption by Country") %>%
      colorbar(title = "Area Type")
    return(barchart)
  })
}


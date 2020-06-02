# Final-project-abmw app server script
library("dplyr")
library("plotly")
library("tidyr")
library("stringr")

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
}

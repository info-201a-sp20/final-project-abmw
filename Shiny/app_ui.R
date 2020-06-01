# Final-project-abmw app ui script
library("shiny")
library("ggplot2")
library("dplyr")
library("plotly")
library("rsconnect")
library("lintr")

# Define UI for the Introduction page 
ui <- fluidPage(
  titlePanel("Constants in a COVID driven life"),
  img("The Stages of Coffee", src = "../Shiny/coffee.jpg"),
 h2("Overview"),
 
 p("While the world seems to be in a standstill,
 we thought we would choose an aspect of many people’s 
 lives that serves as a constant: coffee. Coffee is a 
 bridge for people to connect, so looking into it further 
 to see who/where experiences coffee in different ways is 
 very interesting to our group. Our goal is that through 
 this project we want to understand how the global consumption 
 differs across countries and over time."),
 
 p("For this final project, we decided to use the USDA and World Bank
   databases which provides insights concering the household and worldwide 
   consumption of coffee.The United States Department of Agriculture (USDA) 
   collects data from agency activities which are then summarized into reports. 
   The file we are going to explore consists of data about coffee bean production, 
   export, import and consumption for every country by year. With this data, we can 
   answer our questions about how coffee production and coffee culture is distributed 
   around the world. Addtionally, we decided to utilize the World Bank dataset exploring
   household consumption of coffee. This data was collected from the World Bank; they 
   collected the data using sample surveys to understand the area segments in which 
   coffee consumption per household was highest. They also created ranges which demonstrate 
   the household coffee consumption by rural, urban, and national areas"),
 h2("Major Questions"),
 p("What time do people drink coffee?")
)
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
  p(strong("Authors: Andrea Argueta, Mariam Khan, Brynna Kilcline, and William Zhang")),
  
  p(strong("Informatics 201-Section BA")),
  
  img("The Stages of Coffee", src = "coffee.jpg"),
 
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
   the household coffee consumption by rural, urban, and national areas."),
 h2("Major Questions"),
 p("What does household consumption look like by country?"),
 p("How is the total porduction of coffee distributed around the world?"),
 p("What cultures and countries consume coffee and how it may affect them economically?"),
 map_page,
 tabsetPanel(
   tabPanel("Line Graph",
            sidebarLayout(
              sidebarPanel(selectInput
                           (inputId = "state", label = "Coffee Line",
                             choices = state_list),
              ),
              mainPanel(
                plotlyOutput(outputId = "chart")
              )
            )
   ),
   
   tabsetPanel(
     tabPanel("Bar Graph",
              sidebarLayout(
                sidebarPanel(selectInput
                             (inputId = "state", label = "Coffee Bar Chart",
                               choices = state_list),
                ),
                mainPanel(
                  plotlyOutput(outputId = "chart")
                )
              )
     ),
   )
 )
 
)

map_page <- tabsetPanel(
  tabPanel("Map",
    sidebarLayout(
      sidebarPanel(selectInput(inputId = "year", label = "Year",
                    choices = as.list(1961:2018), selected = 2018)),
      mainPanel(
        plotlyOutput(outputId = "map")
      )
    )
  )
)

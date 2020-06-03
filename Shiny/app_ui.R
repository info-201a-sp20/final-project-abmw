# Final-project-abmw app ui script
library("shiny")
library("ggplot2")
library("dplyr")
library("plotly")
library("rsconnect")
library("lintr")
library("htmltools")

map_page <-
  tabPanel("Domestic Consumption",
    includeCSS("style.css"),
    sidebarLayout(
      sidebarPanel(
        br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
        selectInput(inputId = "year", label = "Year",
                               choices = as.list(1961:2018), selected = 2018)),
      mainPanel(
        p("Domestic coffee consumption per capita is defined as the amount of
          coffee a country produced and imported minus the amount it exported,
          divided by the country's population. In other words, it's the average
          amount of coffee that stayed in the country per person. This helps us
          compare coffee consumption across countries regardless of their
          relative sizes."),
        br(),
        plotlyOutput(outputId = "map")
      )
    )
  )

intro_page <- tabPanel(
  title = "Introduction",
  p(strong("Authors: Andrea Argueta, Mariam Khan, Brynna Kilcline, and William Zhang")),
  p(strong("Informatics 201-Section BA")),
  img("The Stages of Coffee", src = "coffee.jpg"),
  h2("Overview"),
  p("While the world seems to be in a standstill,
   we thought we would choose an aspect of many people's 
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
 p("How is the total production of coffee distributed around the world?"),
 p("What cultures and countries consume coffee and how it may affect them economically?"),
)

conclusion_page <- tabPanel(
  "Conclusion",
  p("High levels of domestic coffee consumption from 1961 to 2002 are mostly
    limited to countries known for producing coffee, like Brazil, Colombia,
    Venezuela, and Ethiopia. In 2003, there is a general spread of coffee
    consumption, especially in the 'Western' countries. (Few European countries are
    represented in the visualization, but the ones that are show an increase,
    along with the United States, Canada, and Australia.) It's unclear whether the
    sudden change is genuine or due to an increase in availability of data, but the
    overall pattern remains clear. In the most recent years, some of these
    countries even surpass the coffee producers in domestic consumption.")
  #takeaway2
  #takeaway3
)

# Define UI for the Introduction page 
ui <- navbarPage(
  "Constants in a COVID- Driven Lifestyle",
  intro_page,

 map_page,
#  tabsetPanel(
#    tabPanel("Line Graph",
#             sidebarLayout(
#               sidebarPanel(selectInput
#                            (inputId = "state", label = "Coffee Line",
#                              choices = state_list),
#               ),
#               mainPanel(
#                 plotlyOutput(outputId = "chart")
#               )
#             )
#    ),
#    
#    tabsetPanel(
#      tabPanel("Bar Graph",
#               sidebarLayout(
#                 sidebarPanel(selectInput
#                              (inputId = "state", label = "Coffee Bar Chart",
#                                choices = state_list),
#                 ),
#                 mainPanel(
#                   plotlyOutput(outputId = "chart")
#                 )
#               )
#      ),
#    )
#  )
#  
  conclusion_page
)

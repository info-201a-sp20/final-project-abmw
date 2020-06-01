# Final-project-abmw app ui script
library("shiny")
library("ggplot2")
library("dplyr")
library("plotly")
library("rsconnect")
library("lintr")

# Define UI for the Introduction page 
ui <- fluidPage(
  titlePanel("Coffee"),
 p("While the world seems to be in a standstill,
 we thought we would choose an aspect of many people’s 
 lives that serves as a constant: coffee. Coffee is a 
 bridge for people to connect, so looking into it further 
 to see who/where experiences coffee in different ways is 
 very interesting to our group. Our goal is that through 
 this project we want to understand how the global consumption 
 differs across countries and over time.")
 
 p("For this final project, we decided to use the USDA and World Bank
   databases which provides insights concering the household and worldwide 
   consumption of coffee")
 tabsetPanel(
   tabPanel("Map",
            sidebarLayout(
              sidebarPanel(selectInput
                           (inputId = "state", label = "Coffee Map",
                             choices = state_list),
              ),
              mainPanel(
                plotlyOutput(outputId = "chart")
              )
            )
   ),
   
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

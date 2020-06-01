# Final-project-abmw app ui script
library("shiny")
library("ggplot2")
library("dplyr")
library("DT")
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
)

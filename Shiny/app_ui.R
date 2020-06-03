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
line_page <-
  tabPanel("Country Production",
    sidebarLayout(
      sidebarPanel(selectInput(inputId = "Country", label = "Country",
                  choices = c("Global",
                    "Algeria","Angola","Argentina",
                    "Australia","Benin","Bolivia",
                    "Brazil","Burundi","Cameroon",
                    "Canada","Central African Republic",
                    "Chile","China","Colombia","Congo (Brazzaville)",
                    "Congo (Kinshasa)","Costa Rica","Cote d'Ivoire",
                    "Cuba", "Dominican Republic","Ecuador",
                    "Egypt","El Salvador","Equatorial Guinea",
                    "Ethiopia","European Union","Gabon","Ghana",
                    "Guatemala","Guinea","Guyana",
                    "Haiti","Honduras","India",
                    "Indonesia","Iran","Jamaica",
                    "Japan","Jordan","Kazakhstan",
                    "Kenya","Korea, South","Laos",
                    "Liberia","Madagascar","Malawi",
                    "Malaysia","Mexico","Morocco",
                    "New Caledonia","New Zealand","Nicaragua",
                    "Nigeria","Norway","Panama",
                    "Papua New Guinea","Paraguay","Peru",
                    "Philippines","Russia","Rwanda",
                    "Serbia","Sierra Leone",
                    "Singapore","South Africa","Sri Lanka",
                    "Switzerland","Taiwan","Tanzania",
                    "Thailand","Togo","Trinidad and Tobago",
                    "Turkey","Uganda","Ukraine",
                    "United States","Venezuela","Vietnam",
                    "Yemen","Yemen (Sanaa)","Zambia",
                    "Zimbabwe"), 
                    selected = "Global")),
      mainPanel(
        p("The total production of coffee is defined as the sum of all types
          of coffee produced including bean, ground and roast coffee. 
          The chart visualizes the production of coffee by year from every country
          in the dataset provided by the United States Department of Agriculture."),
        plotlyOutput(outputId = "line")
      )
    )
  )
bar_page <- 
  tabPanel("Household Consumption",
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "country_one",
                    label = "Choose first country:",
                    choices = list(
                      "Afghanistan","Albania", "Armenia", "Azerbaijan", "Bangladesh",
                      "Belarus", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina",
                      "Brazil", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
                      "Cameroon", "Cabo Verde", "Chad", "China", "Columbia",
                      "Congo, Dem. Rep.", "Congo, Rep.", "Cote d\'Ivoire", "Djibouti",
                      "Eqypt, Arab Rep.", "El Salvador", "Ethiopia", "Fiji", "Gabon",
                      "Gambia, The", "Ghana", "Guatemal", "Guinea", "Honduras", "India",
                      "Indonesia", "Iraq", "Jamaica", "Jordan", "Kazakhstan",
                      "Kenya", "Kyrqyz Republic", "Lao PDR", "Latvia", "Lesotho",
                      "Liberia", "Lithuania", "Macedonia, FYR", "Madagascar",
                      "Malawi", "Maldives", "Mali", "Mauritania", "Mauritius",
                      "Mexico", "Moldova", "Mongolia", "Montenegro", "Morocco",
                      "Mozambique", "Namibia", "Nepal", "Nicaragua", "Niger",
                      "Nigeria", "Pakistan", "Papua New Guinea", "Peru",
                      "Philippines", "Romania", "Russian Federation", "Rwanda",
                      "Sao Tome and Principe", "Senegal", "Serbia", "Sierra Leone",
                      "South Africa", "Sri Lanka", "Swaziland", "Tajikstan", "Tanzania",
                      "Thailand", "Timor Leste", "Togo", "Turkey", "Uganda", "Ukraine",
                      "Vietnam", "Yemen, Rep.", "Zambia"
                      )
                    ),
        selectInput(inputId = "country_two",
                    label = "Choose second country:",
                    choices = list(
                      "Albania","Afghanistan", "Armenia", "Azerbaijan", "Bangladesh",
                      "Belarus", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina",
                      "Brazil", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
                      "Cameroon", "Cabo Verde", "Chad", "China", "Columbia",
                      "Congo, Dem. Rep.", "Congo, Rep.", "Cote d\'Ivoire", "Djibouti",
                      "Eqypt, Arab Rep.", "El Salvador", "Ethiopia", "Fiji", "Gabon",
                      "Gambia, The", "Ghana", "Guatemal", "Guinea", "Honduras", "India",
                      "Indonesia", "Iraq", "Jamaica", "Jordan", "Kazakhstan",
                      "Kenya", "Kyrqyz Republic", "Lao PDR", "Latvia", "Lesotho",
                      "Liberia", "Lithuania", "Macedonia, FYR", "Madagascar",
                      "Malawi", "Maldives", "Mali", "Mauritania", "Mauritius",
                      "Mexico", "Moldova", "Mongolia", "Montenegro", "Morocco",
                      "Mozambique", "Namibia", "Nepal", "Nicaragua", "Niger",
                      "Nigeria", "Pakistan", "Papua New Guinea", "Peru",
                      "Philippines", "Romania", "Russian Federation", "Rwanda",
                      "Sao Tome and Principe", "Senegal", "Serbia", "Sierra Leone",
                      "South Africa", "Sri Lanka", "Swaziland", "Tajikstan", "Tanzania",
                      "Thailand", "Timor Leste", "Togo", "Turkey", "Uganda", "Ukraine",
                      "Vietnam", "Yemen, Rep.", "Zambia"
                    )
        ),
      ),
      mainPanel(
        p("This chart visualizes the comparison of household consumption
          between rural and urban areas of two countries in US dollars. It uses the sum of 
          currency spent on coffee, tea, and cocoa products."),
        plotlyOutput(outputId = "barchart")
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
   databases which provide insights concerning the household and worldwide 
   consumption of coffee. The United States Department of Agriculture (USDA) 
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
  "Takeaways",
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
  "Constants in a COVID-Driven Lifestyle",
  intro_page,
  map_page,
  line_page,
  bar_page,
  conclusion_page
)

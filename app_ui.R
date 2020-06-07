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
                    "Algeria", "Angola", "Argentina",
                    "Australia", "Benin", "Bolivia",
                    "Brazil", "Burundi", "Cameroon",
                    "Canada", "Central African Republic",
                    "Chile", "China", "Colombia", "Congo (Brazzaville)",
                    "Congo (Kinshasa)", "Costa Rica", "Cote d'Ivoire",
                    "Cuba", "Dominican Republic", "Ecuador",
                    "Egypt", "El Salvador", "Equatorial Guinea",
                    "Ethiopia", "European Union", "Gabon", "Ghana",
                    "Guatemala", "Guinea", "Guyana",
                    "Haiti", "Honduras", "India",
                    "Indonesia", "Iran", "Jamaica",
                    "Japan", "Jordan", "Kazakhstan",
                    "Kenya", "Korea, South", "Laos",
                    "Liberia", "Madagascar", "Malawi",
                    "Malaysia", "Mexico", "Morocco",
                    "New Caledonia", "New Zealand", "Nicaragua",
                    "Nigeria", "Norway", "Panama",
                    "Papua New Guinea", "Paraguay", "Peru",
                    "Philippines", "Russia", "Rwanda",
                    "Serbia", "Sierra Leone",
                    "Singapore", "South Africa", "Sri Lanka",
                    "Switzerland", "Taiwan", "Tanzania",
                    "Thailand", "Togo", "Trinidad and Tobago",
                    "Turkey", "Uganda", "Ukraine",
                    "United States", "Venezuela", "Vietnam",
                    "Yemen", "Yemen (Sanaa)", "Zambia",
                    "Zimbabwe"),
                    selected = "Global")),
      mainPanel(
        p("The total production of coffee is defined as the sum of all types
          of coffee produced including bean, ground and roast coffee.
          The chart visualizes the production of coffee by year from every
          country in the dataset provided by the United States Department of
          Agriculture."),
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
                      "Afghanistan", "Albania", "Armenia", "Azerbaijan",
                      "Bangladesh", "Belarus", "Benin", "Bhutan", "Bolivia",
                      "Bosnia and Herzegovina", "Brazil", "Bulgaria",
                      "Burkina Faso", "Burundi", "Cambodia",
                      "Cameroon", "Cabo Verde", "Chad", "China", "Columbia",
                      "Congo, Dem. Rep.", "Congo, Rep.", "Cote d\'Ivoire",
                      "Djibouti", "Egypt, Arab Rep.", "El Salvador",
                      "Ethiopia", "Fiji", "Gabon", "Gambia, The", "Ghana",
                      "Guatemala", "Guinea", "Honduras", "India",
                      "Indonesia", "Iraq", "Jamaica", "Jordan", "Kazakhstan",
                      "Kenya", "Kyrqyz Republic", "Lao PDR", "Latvia",
                      "Lesotho", "Liberia", "Lithuania", "Macedonia, FYR",
                      "Madagascar", "Malawi", "Maldives", "Mali",
                      "Mauritania", "Mauritius", "Mexico", "Moldova",
                      "Mongolia", "Montenegro", "Morocco",
                      "Mozambique", "Namibia", "Nepal", "Nicaragua", "Niger",
                      "Nigeria", "Pakistan", "Papua New Guinea", "Peru",
                      "Philippines", "Romania", "Russian Federation",
                      "Rwanda", "Sao Tome and Principe", "Senegal", "Serbia",
                      "Sierra Leone", "South Africa", "Sri Lanka",
                      "Swaziland", "Tajikstan", "Tanzania", "Thailand",
                      "Timor Leste", "Togo", "Turkey", "Uganda", "Ukraine",
                      "Vietnam", "Yemen, Rep.", "Zambia"
                      )
                    ),
        selectInput(inputId = "country_two",
                    label = "Choose second country:",
                    choices = list(
                      "Albania", "Afghanistan", "Armenia", "Azerbaijan",
                      "Bangladesh", "Belarus", "Benin", "Bhutan", "Bolivia",
                      "Bosnia and Herzegovina", "Brazil", "Bulgaria",
                      "Burkina Faso", "Burundi", "Cambodia",
                      "Cameroon", "Cabo Verde", "Chad", "China", "Columbia",
                      "Congo, Dem. Rep.", "Congo, Rep.", "Cote d\'Ivoire",
                      "Djibouti", "Egypt, Arab Rep.", "El Salvador",
                      "Ethiopia", "Fiji", "Gabon",
                      "Gambia, The", "Ghana", "Guatemal", "Guinea", "Honduras",
                      "India", "Indonesia", "Iraq", "Jamaica", "Jordan",
                      "Kazakhstan", "Kenya", "Kyrqyz Republic", "Lao PDR",
                      "Latvia", "Lesotho", "Liberia", "Lithuania",
                      "Macedonia, FYR", "Madagascar",
                      "Malawi", "Maldives", "Mali", "Mauritania", "Mauritius",
                      "Mexico", "Moldova", "Mongolia", "Montenegro", "Morocco",
                      "Mozambique", "Namibia", "Nepal", "Nicaragua", "Niger",
                      "Nigeria", "Pakistan", "Papua New Guinea", "Peru",
                      "Philippines", "Romania", "Russian Federation", "Rwanda",
                      "Sao Tome and Principe", "Senegal", "Serbia",
                      "Sierra Leone", "South Africa", "Sri Lanka", "Swaziland",
                      "Tajikstan", "Tanzania", "Thailand", "Timor Leste",
                      "Togo", "Turkey", "Uganda", "Ukraine",
                      "Vietnam", "Yemen, Rep.", "Zambia"
                    )
        ),
      ),
      mainPanel(
        p("This chart visualizes the comparison of household consumption
          between rural and urban areas of two countries in US dollars.
          It uses the sum of currency spent on coffee, tea, and cocoa
          products."),
        plotlyOutput(outputId = "barchart")
      )
    )
  )

intro_page <- tabPanel(
  title = "Introduction",
  p(strong("Authors: Andrea Argueta, Mariam Khan, Brynna Kilcline,
           and William Zhang")),
  p(strong("Informatics 201-Section BA")),
  img(strong("The Stages of Coffee"),
      src = "https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
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
   The file we are going to explore consists of data about coffee bean
   production, export, import and consumption for every country by year.
   With this data, we can answer our questions about how coffee production
   and coffee culture is distributed around the world. Addtionally, we
   decided to utilize the World Bank dataset exploring household
   consumption of coffee. This data was collected from the World Bank; they
   collected the data using sample surveys to understand the area segments
   in which coffee consumption per household was highest. They also
   created ranges which demonstrate the household coffee consumption
   by rural, urban, and national areas. For more information about our
    datasets, copy this link:"),
  p("http://datatopics.worldbank.org/consumption/product/Coffee,-Tea-and-Cocoa"),
 h2("Major Questions"),
 p("What does household consumption look like by country?"),
 p("How is the total production of coffee distributed around the world?"),
 p("What cultures and countries consume coffee and how it may affect them
   economically?"),
)

# return the names of the 6 countries with the highest domestic consumption
# per capita
get_top <- function(year) {
  top_6 <- read.csv(
    "data/dom_consumption_df.csv", stringsAsFactors = F) %>%
    filter(Market_Year == year) %>%
    filter(Country_Name != "European Union") %>%
    arrange(-Consumption.per.Capita) %>%
    head() %>%
    pull(Country_Name)
  top <- paste(top_6[1], top_6[2], top_6[3], top_6[4], top_6[5], sep = ", ")
  top <- paste0(top, ", and ", top_6[6])
  return(top)
}

conclusion_page <- tabPanel(
  "Takeaways",
  h2("Overall Takeaways"),
  h3("Map Takeaways"),
  p(paste0("High levels of domestic coffee consumption from 1961 to 2002
    are mostly
    limited to countries known for producing coffee. In 2002, the top-consuming
    countries were ", get_top(2002), ". In 2003, there is a general spread of
    coffee consumption, especially to the 'Western' countries. (Few European
    countries are represented in the visualization, but the ones that are show
    a marked increase.) The top-consuming countries of 2003 were ",
    get_top(2003), ". While it's possible the sudden change is due to an
    increase in availability of data rather than a genuine leap, the overall
    pattern is clear: coffee culture is spreading.")),
  h3("Line Chart Takeaways"),
  p("Some takeaways form the line graph are as follows; in general the global 
    production since 1960 has grown exponentially by over 5000% to the present day. 
    Secondly, Brazil’s coffee production has fluctuated throughout the years taking 
    steep drops and increasing rapidly. Lastly, Angola’s coffee production was 2500 
    bags in a calendar year reaching a peak of 4063 and then steadily dropping to 0 
    in the late 90’s."),
  h3("Bar Chart Takeaways"),
  p(paste0("Household consumption varies per country between area types 
    (rural vs urban). It was very interesting to see the drastic changes as we 
    looked through and compared different countries. Some specific takeaways are
    that the rural household consumption in Kazakhstan is very close to the
    urban household consumption in Belarus. Also, in Brazil, the urban household
    consumption accounts for the majority of consumption compared to rural, meaning
    there is more consumption in the cities of Brazil."))
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

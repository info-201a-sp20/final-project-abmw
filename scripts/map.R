library("ggplot2")
library("dplyr")
library("maps")

create_map <- function(df) {
  consumption_2019 <- df %>%
    select(Country_Name, Market_Year, Domestic.Consumption) %>%
    filter(Market_Year == 2019)

  # make country names match
  consumption_2019[65, "Country_Name"] <- "USA"
  consumption_2019[14, "Country_Name"] <- "Democratic Republic of the Congo"
  consumption_2019[16, "Country_Name"] <- "Ivory Coast"
  consumption_2019[36, "Country_Name"] <- "South Korea"

  eu_members <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus",
                  "Czech Republic", "Denmark", "Estonia", "Finland", "France",
                  "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia",
                  "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland",
                  "Portugal", "Romania", "Slovakia", "Slovenia", "Spain",
                  "Sweden")
  eu_consumption <- consumption_2019 %>%
    filter(Country_Name == "European Union") %>%
    pull(Domestic.Consumption)
  eu_df <- data.frame(Country_Name = eu_members, Market_Year = 2019,
                      Domestic.Consumption = eu_consumption)
  consumption_2019 <- rbind(consumption_2019, eu_df)

  world <- map_data("world") %>%
    left_join(consumption_2019, by = c("region" = "Country_Name")) %>%
    replace(is.na(.), 0)

  map <- ggplot(data = world) +
    geom_polygon(
      mapping = aes(x = long, y = lat, group = group,
                    fill = Domestic.Consumption),
      color = "brown",
      size = .01
    ) +
    scale_fill_continuous(low = "white", high = "brown") +
    labs(title = "Gross Domestic Consumption by Country 2019",
         caption = "Domestic consumption in the EU is a combined total
       rather than per individual country.",
         fill = "Consumption (in 1000 60kg bags)")

  return(map)
}

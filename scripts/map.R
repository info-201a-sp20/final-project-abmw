library("ggplot2")
library("dplyr")
library("maps")

df <- read.csv("../data/coffee_df.csv", stringsAsFactors = FALSE)

consumption_2019 <- df %>%
  select(Country_Name, Market_Year, Domestic.Consumption) %>%
  filter(Market_Year == 2019)

# make country names match
consumption_2019[65, "Country_Name"] <- "USA"
consumption_2019[14, "Country_Name"] <- "Democratic Republic of the Congo"
consumption_2019[16, "Country_Name"] <- "Ivory Coast"
consumption_2019[36, "Country_Name"] <- "South Korea"

world <- map_data("world") %>%
  left_join(consumption_2019, by = c("region" = "Country_Name")) %>%
  replace(is.na(.), 0)

map <- ggplot(data = world) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group,
                  fill = Domestic.Consumption),
    color = "black",
    size = .1
  ) +
  scale_fill_continuous(low = "white", high = "brown")
# add title
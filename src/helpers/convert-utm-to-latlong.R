library(sf)
library(tidyverse)
library(readr)

crime <- read_csv("data/crime_data_all_neighborhoods.csv")
colnames(crime) <- tolower(make.names(colnames(crime)))


# now we mutate crime data to add shapefile information

# first we create as a utm shapefile due to the data structure, 
# then convert to lat/long like census_data and food_data
# crs = 32610 : utm 10
# crs = 4326 : lat/long WGS84

crime_data <- crime %>%
  st_as_sf(coords = c("x", "y"), crs = 32610) %>%
  st_transform(crs = 4326)

# we need to remove (0,0) values for plotting
# to do that we extract coords then filter
crime_coords <- st_coordinates(crime_data)
crime_data <- crime_data[crime_coords[,2] != 0, ]


# test that data is working
plot(crime_data$geometry, col = "green")
library(cancensus)
library(sf)
library(geojsonsf)

load("API_KEY.rda")

options(cancensus.api_key = api_key)
options(cancensus.cache_path = "cache")

vectors <- c("v_CA21_1",
             "v_CA21_6",
             "v_CA21_449",
             "v_CA21_1040",
             "v_CA21_1085",
             "v_CA21_905")


census_data <- get_census(dataset = "CA21",
                          regions = list(CMA="59933"),
                          vectors = vectors,
                          labels = "detailed",
                          geo_format = "sf",
                          level = "DA")

can_api_key <- ""
save(census_data, file = "data/census.rda")

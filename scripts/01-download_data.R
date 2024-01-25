library(opendatatoronto)
library(dplyr)
library(ggplot2)

resources <- list_package_resources("police-annual-statistical-report-reported-crimes")
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
write.csv(data, "inputs/data/raw_data.csv", row.names = FALSE)


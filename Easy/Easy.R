#Required libraries.

library("rgbif")
library("mapr")
library("leaflet")


# Easy: Install package rgbif and download sample data for few species. 
# Use package mapr to plot the occurrence data on maps.

# In this example, we look for data for the speciment "Puma concolor", from the dataset GBIF.
# The resulting occ data is then conveniently converted into a data.frame using the the occd2f function.

data <- occ(query = "Puma concolor", from = "gbif") %>% occ2df()

# Data for multiple species is obtained by combining them in the query argument of the occ function.

specimenName <- c('Accipiter striatus', 'Setophaga caerulescens', 'Carduelis tristis')
data1 <- occ(query=specimenName, from='gbif', gbifopts=list(hasCoordinate=TRUE), limit=10) %>% occ2df()

# Other than GBIF, there are other multiple engines, namely ecoengine, bison, inat, antweb and more; which can be used to collect data.
# This can be done as: 

species_list <- c('Accipiter striatus', 'Setophaga caerulescens', 'Carduelis tristis')
data2 <- occ(species_list, from = c('gbif', 'ecoengine', 'antweb')) %>% occ2df()


# Data visualisation: 
# For static plots, we may use ggplot.

splist <- c("Danaus plexippus", "Accipiter striatus", "Pinus contorta")
gbif_data <- occ(query = splist, from = "gbif")
map_ggplot(gbif_data)

# This creates a plot with occurence of the three species across the world.

# For creating a dynamic plot, we can use Leaflet.js

splist_dy <- c("Danaus plexippus", "Accipiter striatus", "Pinus contorta")
gbif_data_dy <- occ(query = splist_dy, from = 'gbif', has_coords = TRUE, limit = 50)
map_leaflet(gbif_data_dy)

# This creates a dynamic plot showing the occurrence of the three species.





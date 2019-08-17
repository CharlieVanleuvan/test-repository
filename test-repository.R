#Necessary packages
library(maps)
library(ggplot2)
library(evaluate)
library("mapproj")

#build a dataframe of US states
dummyMapdf <- data.frame(state.name, stringsAsFactors = F) #state.name is built in state dataset
dummyMapdf$state <- tolower(dummyMapdf$state.name) #for maps in ggplot, need to use lower case
us <- map_data("state")

#this is a basic map of the US, can add geoms to this to show data (such as population density).
#the ggplot() call will need to include a state column 
#geom_map() needs to be called for map = us to show a map
simpleMap <- ggplot(dummyMapdf, aes(map_id = state)) +
             geom_map(map = us, fill = "skyblue", color = "black") +
             expand_limits(x = us$long, y = us$lat) +
             coord_map() + ggtitle("Basic Map of the USA") +
             xlab("Longitude") + ylab("Latitude")
simpleMap
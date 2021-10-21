#downlaod shapefile and get gcentroid coordinates
install.packages("rgdal")
library(rgdal)
map <- readOGR("World_Countries", layer="World_Countries")

install.packages("ggplot2")
library(ggplot2)

plot(map)


# Load the rgeos library
install.packages("rgeos")
library(rgeos)

#name all countries on map
map2 <- as.data.frame(map)
View(map2)

#calculated coordinates of the centrepoints of all countries
centers <- gCentroid(map, byid=TRUE)
centers <-as.data.frame(centers)
View(centers)

#add country name to coordinates list
centerpoints <- merge(map2, centers, all=TRUE )
View(centerpoints)

--------------------------------------------------------------------------



getwd()
setwd("C:/Users/dalha001/OneDrive - WageningenUR/Supervision/MSC/Edith van Oostrom/R/Apples")

--------------------------------------------------------------------------
library(raster)

raster

test_tmin<-brick("weather data/tmin.2017.nc")

plot(test_tmin[[365]])

Wagen

extract(test_tmin, SpatialPoints(cbind(5.673578442041631, 51.980419566974746)))
spatial 

SpatialPoints(cbind(51.980419566974746, 5.673578442041631))
str(test_tmin)

(test_tmin@data@min)


list.files("weather data")

for (i in 1:10){
  print(i)
}

for (file in list.files("weather data")){
  print(file)
}
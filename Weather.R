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

centers <- data.frame(gCentroid(map)) 
View(centers)



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
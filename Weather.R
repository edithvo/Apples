#downlaod shapefile and get gcentroid coordinates
install.packages("rgdal")
library(rgdal)
map <- readOGR("World_Countries", layer="World_Countries")

install.packages("ggplot2")
library(ggplot2)

library(mapview)
mapview(centers[230])
centers
plot(map)+ points(centers$x, centers$y)

# Load the rgeos library
install.packages("rgeos")
library(rgeos)

#name all countries on map
map2 <- as.data.frame(map)
View(map2)
map2$country_nr <- c(1:252)

#calculated coordinates of the centrepoints of all countries
centers <- gCentroid(map, byid=TRUE)
centers <-as.data.frame(centers)
centers$country<-map@data$COUNTRY
View(centers)
plot(centers)

--------------------------------------------------------------------------




--------------------------------------------------------------------------

install.packages("raster")
  library(raster)

raster

install.packages("ncdf4")
library(ncdf4)



-------------------------------------------------------------------------





library(reshape2)

testtavg<-melt(testtavg)


head(centerpoints[,2:3])


list.files("weather data/Tmax")
list.files("weather data/Tmin")
list.files("weather data/Tmin")[1]


testtmin<-extract(test_tmin, SpatialPoints(centers[1:252,1:2]))
testtmax<-extract(test_tmax, SpatialPoints(centers[1:252,1:2]))


#first file tmin

tmin_first<-(list.files("weather data/Tmin")[1])
tmin_brickfirst<-brick(paste("weather data/Tmin/",tmin_first,sep=""))
spatial_centers<-SpatialPoints(centers[1:252,1:2])
tmin_interfirst<-extract(rotate(tmin_brickfirst), spatial_centers)
tmin_firstmelt<-melt(tmin_interfirst)

tmin_all<-tmin_firstmelt

#Loop tmin

for (i in list.files("weather data/Tmin")[-1]){
  tmin_brick<-brick(paste("weather data/Tmin/",i,sep=""))
  tmin_inter<-extract(rotate(tmin_brick), spatial_centers)
  tmin_melt<-melt(tmin_inter) 
  tmin_all<-rbind(tmin_all, tmin_melt)
    closeAllConnections()
} 


#first file tmax

tmax_first<-(list.files("weather data/Tmax")[1])
tmax_brickfirst<-brick(paste("weather data/Tmax/",tmax_first,sep=""))
spatial_centers<-SpatialPoints(centers[1:252,1:2])
tmax_interfirst<-extract(rotate(tmax_brickfirst), spatial_centers)
tmax_firstmelt<-melt(tmax_interfirst)

tmax_all<-tmax_firstmelt


#Loop tmax

for (i in list.files("weather data/Tmax")[-1]){
  tmax_brick<-brick(paste("weather data/Tmax/",i,sep=""))
  tmax_inter<-extract(rotate(tmax_brick), spatial_centers)
  tmax_melt<-melt(tmax_inter) 
  tmax_all<-rbind(tmax_all, tmax_melt)
  closeAllConnections()
  print(i)
} 




---------------------------------------------------------------------------
#change column names Tmax

# get column names
colnames(tmax_all)

# Rename column 
names(tmax_all)[names(tmax_all) == "Var1"] <- "country_nr"
names(tmax_all)[names(tmax_all) == "Var2"] <- "date"
names(tmax_all)[names(tmax_all) == "value"] <- "Tmax"

# get column names
colnames(tmax_all)

#change column names Tmin

# get column names
colnames(tmin_all)

# Rename column 
names(tmin_all)[names(tmin_all) == "Var1"] <- "country_nr"
names(tmin_all)[names(tmin_all) == "Var2"] <- "date"
names(tmin_all)[names(tmin_all) == "value"] <- "Tmin"

# get column names
colnames(tmin_all)

summary(tmax_all)
summary(tmin_all)

# reformat date column to as.Date
tmax_all$date<-as.Date(gsub("X", "", tmax_all$date), "%Y.%m.%d")
tmin_all$date<-as.Date(gsub("X", "", tmin_all$date), "%Y.%m.%d")

---------------------------------------------------------------------------

  
library(plyr)


  #merge Tmin and Tmax
Temp <- join(tmax_all, tmin_all)
head(Temp)
summary(Temp$Tmin)
View(Temp)

Temp$Taveg <- (Temp$Tmax + Temp$Tmin)/2
summary(Temp)

# add a year column using the year() function of the lubridate package 
library(lubridate)

Temp$year <- year(Temp$date)
View(Temp)
----------------------------------------------------------------------------


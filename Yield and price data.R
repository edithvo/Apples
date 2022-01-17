getwd()

#read dataset FAO global prices
prices <- read.csv2("FAOSTAT_data_9-14-2021 apple prices global.csv", dec = ".")

str(prices)
View(prices)

#read dataset FAO Yields
yield <- read.csv2("FAOSTAT_data_9-30-2021 apple yield.csv", dec = ".")
View(yield)

yield_pq <- read.csv2("FAOSTAT_data_12-3-2021.csv", dec = ".")



#Remove unnecessary data
#keep columns yield
keep <- c("Area", "Year", "Value") 
yield <- yield[keep] 

names(yield)[names(yield) == "Value"] <- "Yield"

#Remove unnecessary data
#keep columns pq
keep <- c("Area", "Year", "Value") 
yield_pq <- yield_pq[keep] 

names(yield_pq)[names(yield_pq) == "Value"] <- "pq"

#keep columns price
keep <- c("Area", "Year", "Value") 
prices <- prices[keep] 

names(prices)[names(prices) == "Value"] <- "Price"

#merge Prices and yield dataset
data <-merge(yield, prices, all=TRUE)
View(data)

#merge Prices and pq dataset
data_pq <-merge(yield_pq, prices, all=TRUE)
View(data_pq)

setdiff(unique(data$Area),map@data$COUNTRY)


#adapt names in dataset to the ones used on the map
data$Area<-gsub( "Russian Federation","Russia",data$Area)
data$Area<-gsub( "Belgium-Luxembourg","Luxembourg",data$Area)
data$Area<-gsub( "China, mainland","China",data$Area)
data$Area<-gsub( "Bolivia (Plurinational State of)","Bolivia",data$Area)
data$Area<-gsub( "USSR","Russia",data$Area)
data$Area<-gsub( "North Macedonia","Macedonia",data$Area)
data$Area<-gsub( "Democratic People's South Korea","South Korea",data$Area)
data$Area<-gsub( "Saint Vincent and the Grenadines","St. Vincent and the Grenadines",data$Area)
data$Area<-gsub( "Syrian Arab Republic","Syria",data$Area)
data$Area<-gsub( "United States of America","United States",data$Area)
data$Area<-gsub( "United Kingdom of Great Britain and Northern Ireland","United Kingdom",data$Area)
data$Area<-gsub( "Serbia and Montenegro","Serbia",data$Area)
data$Area<-gsub( "Republic of Moldova","Moldova",data$Area)
data$Area<-gsub( "Democratic People's Republic of Korea","North korea",data$Area)
data$Area<-gsub( "Iran (Islamic Republic of)","Iran",data$Area)
data$Area<-gsub( "China, Taiwan Province of","Taiwan",data$Area)
data$Area<-gsub( "Czechoslovakia","Slovakia",data$Area)
data$Area<-gsub( "Czechia","Czech Republic",data$Area)


summary(data)
names(map2)[1] <- "Area"

Data_fao <- merge(data, map2)
data_fao_pq <- merge(data_pq, map2)

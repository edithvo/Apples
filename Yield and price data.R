getwd()

#read dataset FAO global prices
prices <- read.csv2("FAOSTAT_data_9-14-2021 apple prices global.csv")
View(prices)

#read dataset FAO Yields
yield <- read.csv2("FAOSTAT_data_9-30-2021 apple yield.csv")
View(yield)


#Remove unnecessary data
#keep columns yield
keep <- c("Area", "Year", "Value") 
yield <- yield[keep] 

names(yield)[names(yield) == "Value"] <- "Yield"


#keep columns price
keep <- c("Area", "Year", "Value") 
prices <- prices[keep] 

names(prices)[names(prices) == "Value"] <- "Price"

#merge Prices and yield dataset
data <-merge(yield, prices, all=TRUE)
View(data)


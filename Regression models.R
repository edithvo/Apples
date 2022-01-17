# use the fixest package 
library(fixest)
library(ggplot2)
data_final$Frost_days <- data_final$frost

# estimate the feols command
# follow the instructions 
# two way fixed effects by country and year
# double clustered standard errors by country and year
# https://github.com/lrberge/fixest/issues/6
# vcov = "twoway"
# run once for price once for yield




#Price model with year 
model_price = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final)
summary(model_price)


#Yield model with year
model_yield = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final)
summary(model_yield)


#Yield model with year temp -1
model_yield1 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final1)
summary(model_yield1)

#Price model with year temp -1
model_price1 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final1)
summary(model_price1)



#Price model with year temp -2
model_price2 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final2)
summary(model_price2)

#Yield model with year temp -2
model_yield2 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final2)
summary(model_yield2)


#Price model with year temp -3
model_price3 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final3)
summary(model_price3)

#Yield model with year temp -3
model_yield3 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final3)
summary(model_yield3)


#Price model with year temp -4
model_price4 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final4)
summary(model_price4)

#Yield model with year temp -4
model_yield4 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final4)
summary(model_yield4)



#Price model with year temp -5
model_price5 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final5)
summary(model_price5)

#Yield model with year temp -5
model_yield5 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final5)
summary(model_yield5)


#Price model with year temp -6
model_price6 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final6)
summary(model_price6)

#Yield model with year temp -6 
model_yield6 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final6)
summary(model_yield6)


#Price model with year temp -7
model_price7 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final7)
summary(model_price7)

#Yield model with year temp -7
model_yield7 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final7)
summary(model_yield7)


#Price model with year temp -8
model_price8 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final8)
summary(model_price8)

#Yield model with year temp -8
model_yield8 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final8)
summary(model_yield8)

#Price model with year temp -9
model_price9 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final9)
summary(model_price9)

#Yield model with year temp -9 
model_yield9 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final9)
summary(model_yield9)



subset(data = subset(data_final9, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))

#top10 production countries

#Price model with year temp < 0 -> significant price/Frost
model_pricec = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec)

#Yield model with year temp <0
model_yieldc = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc)


#Price model with year temp -1 -> 
model_pricec1 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final1, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec1)

#Yield model with year temp -1
model_yieldc1 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final1, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc1)

#Price model with year temp -2 -> significant price/Frost
model_pricec2 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final2, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec2)

#Yield model with year temp -2
model_yieldc2 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final2, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc2)


#Price model with year temp -3
model_pricec3 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final3, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec3)

#Yield model with year temp -3
model_yieldc3 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final3, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc3)

#Price model with year temp -4
model_pricec4 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final4, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec4)

#Yield model with year temp -4
model_yieldc4 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final4, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc4)


#Price model with year temp -5
model_pricec5 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final5, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec5)

#Yield model with year temp -5 frost significant
model_yieldc5 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final5, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc5)


#Price model with year temp -6
model_pricec6 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final6, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec6)

#Yield model with year temp -6 
model_yieldc6 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final6, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc6)


#Price model with year temp -7
model_pricec7 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final7, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec7)

#Yield model with year temp -7
model_yieldc7 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final7, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc7)

#Price model with year temp -8
model_pricec8 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final8, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec8)

#Yield model with year temp -8
model_yieldc8 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final8, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc8)


#Price model with year temp -9 frost not significant anymore
model_pricec9 = feols(log(Price) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final9, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pricec9)

#Yield model with year temp -9 
model_yieldc9 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final9, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_yieldc9)


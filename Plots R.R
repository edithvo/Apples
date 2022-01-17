install.packages("coefplot")

install.packages("colortools")
library(colortools)

coeflabel(model_price = "Frost days below 0ͦC ")
         

library(coefplot)
#coefplots for yield and price all countries
fixest::coefplot(list(model_price, model_price1, model_price2, model_price3, model_price4, model_price5, model_price6, model_price7, model_price8, model_price9), col= sequential("steel blue3"), lwd = 2.5, horiz = TRUE, drop ="Year", dict =c(frost ="Frost days below different\n temperature thresholds", main = NULL, value.lab = "Estimate of effect on log(Yield) and 95% Conf. Int"))
fixest::coefplot(list(model_yield, model_yield1, model_yield2, model_yield3, model_yield4, model_yield5, model_yield6, model_yield7, model_yield8, model_yield9), col= sequential("steel blue3"), lwd = 2.5, horiz = TRUE, drop ="Year", dict =c(frost = "Frost days below different\n temperature thresholds"))

coefplot.data.frame(model_price1)

#coefplots for yield and price top10 countries
fixest::coefplot(list(model_pricec, model_pricec1, model_pricec2, model_pricec3, model_pricec4, model_pricec5, model_pricec6, model_pricec7, model_pricec8, model_pricec9), col= sequential("steel blue3"), lwd = 2.5, horiz = TRUE, drop ="Year", dict =c(frost = "Frost days below different\n temperature thresholds", main = NULL, xlab = "Estimate of effect on log(Yield) and 95% Conf. Int"))
fixest::coefplot(list(model_yieldc, model_yieldc1, model_yieldc2, model_yieldc3, model_yieldc4, model_yieldc5, model_yieldc6, model_yieldc7, model_yieldc8, model_yieldc9), col= sequential("steel blue3"), lwd = 2.5, horiz = TRUE, drop ="Year", dict =c(frost = "Frost days below different\n temperature thresholds", main = NULL))

plot(rotate(tmax_brickfirst[[1]]))+points(centers$x, centers$y, col = "black", cex = .35, pch = 20)

plot (density (Data_overal$Tmax), main = "Density maximum temeprature")
plot (density (Data_overal$Tmin), main = "Density minimum temeprature")

boxplot(data_final$Yield)
boxplot(data_final$Price)




#Plot model

PLOT1 <-  ggplot(data_final, aes(x = frost, y = log(Price))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOT1)

summary(PLOT1)

#Plot model

PLOTlog2 <-  ggplot(data_final8, aes(x = frost, y =  log(Yield))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog2)


#additional plots

ggplot(data_final, aes(x = Yield, y =  Price))  +
  geom_point(colour = "red") +
  geom_smooth(fill = NA)

ggplot(data_final6, aes(x = log(Yield), y =  log(Price)))  +
  geom_point(colour = "red") +
  geom_smooth(fill = NA)

PLOTlog3 <-  ggplot(data_final8, aes(x = Year, y = log(Yield))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog3)

PLOTlog4 <-  ggplot(data_final, aes(x = Year, y = log(Price))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog4)

PLOTlog5 <-  ggplot(data_final, aes(x = Area, y = Frost_days)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog5)

PLOTlog6 <-  ggplot(data_final, aes(x = Area, y = log(Price))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog6)

PLOTlog7 <-  ggplot(data_final, aes(x = Area, y = log(Yield))) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog7)

PLOTlog8 <-  ggplot(data_final, aes(x = Year, y = Frost_days)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
plot(PLOTlog8)
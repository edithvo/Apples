#yield as production quantity (tonnes)



#frost yes or no
Data_overal$DOY<- as.numeric(strftime(Data_overal$date, "%j"))
Data_overal$frost <- ifelse(Data_overal$Tmin<0 & Data_overal$DOY>Data_overal$DOY_start & Data_overal$DOY<Data_overal$DOY_end ,1,0)

testtest<-aggregate(frost ~ country_nr + year, data=Data_overal, FUN=sum)
str(testtest)
names(testtest)[2]<-"Year"
summary(data_fao_pq)
str(data_fao_pq)
library(plyr)
data_final<-join(data_fao_pq,testtest)

# tmin < -1
#frost yes or no
Data_overal1 <- Data_overal
Data_overal1$frost <- ifelse(Data_overal1$Tmin< -1 & Data_overal1$DOY>Data_overal1$DOY_start & Data_overal1$DOY<Data_overal1$DOY_end ,1,0)

testtest1<-aggregate(frost ~ country_nr + year, data=Data_overal1, FUN=sum)
str(testtest1)
names(testtest1)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final1<-join(data_fao_pq,testtest1)



# tmin < -2
#frost yes or no
Data_overal2 <- Data_overal
Data_overal2$frost <- ifelse(Data_overal2$Tmin< -2 & Data_overal2$DOY>Data_overal2$DOY_start & Data_overal2$DOY<Data_overal2$DOY_end ,1,0)

testtest2<-aggregate(frost ~ country_nr + year, data=Data_overal2, FUN=sum)
str(testtest2)
names(testtest2)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final2<-join(data_fao_pq,testtest2)



# tmin < -3
#frost yes or no
Data_overal3 <- Data_overal
Data_overal3$frost <- ifelse(Data_overal3$Tmin< -3 & Data_overal3$DOY>Data_overal3$DOY_start & Data_overal3$DOY<Data_overal3$DOY_end ,1,0)

testtest3<-aggregate(frost ~ country_nr + year, data=Data_overal3, FUN=sum)
str(testtest3)
names(testtest3)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final3<-join(data_fao_pq,testtest3)



# tmin < -4
#frost yes or no
Data_overal4 <- Data_overal
Data_overal4$frost <- ifelse(Data_overal4$Tmin< -4 & Data_overal4$DOY>Data_overal4$DOY_start & Data_overal4$DOY<Data_overal4$DOY_end ,1,0)

testtest4<-aggregate(frost ~ country_nr + year, data=Data_overal4, FUN=sum)
str(testtest4)
names(testtest4)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final4<-join(data_fao_pq,testtest4)

# tmin < -5
#frost yes or no
Data_overal5 <- Data_overal
Data_overal5$frost <- ifelse(Data_overal5$Tmin< -5 & Data_overal5$DOY>Data_overal5$DOY_start & Data_overal5$DOY<Data_overal5$DOY_end ,1,0)

testtest5<-aggregate(frost ~ country_nr + year, data=Data_overal5, FUN=sum)
str(testtest5)
names(testtest5)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final5<-join(data_fao_pq,testtest5)

# tmin < -7
#frost yes or no
Data_overal7 <- Data_overal
Data_overal7$frost <- ifelse(Data_overal7$Tmin< -7 & Data_overal7$DOY>Data_overal7$DOY_start & Data_overal7$DOY<Data_overal7$DOY_end ,1,0)

testtest7<-aggregate(frost ~ country_nr + year, data=Data_overal7, FUN=sum)
str(testtest7)
names(testtest7)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final7<-join(data_fao_pq,testtest7)


# tmin < -6
#frost yes or no
Data_overal6 <- Data_overal
Data_overal6$frost <- ifelse(Data_overal6$Tmin< -6 & Data_overal6$DOY>Data_overal6$DOY_start & Data_overal6$DOY<Data_overal6$DOY_end ,1,0)

testtest6<-aggregate(frost ~ country_nr + year, data=Data_overal6, FUN=sum)
str(testtest6)
names(testtest6)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final6<-join(data_fao_pq,testtest6)

# tmin < -8
#frost yes or no
Data_overal8 <- Data_overal
Data_overal8$frost <- ifelse(Data_overal8$Tmin< -8 & Data_overal8$DOY>Data_overal8$DOY_start & Data_overal8$DOY<Data_overal8$DOY_end ,1,0)

testtest8<-aggregate(frost ~ country_nr + year, data=Data_overal8, FUN=sum)
str(testtest8)
names(testtest8)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final8<-join(data_fao_pq,testtest8)

# tmin < -9
#frost yes or no
Data_overal9 <- Data_overal
Data_overal9$frost <- ifelse(Data_overal9$Tmin< -9 & Data_overal9$DOY>Data_overal9$DOY_start & Data_overal9$DOY<Data_overal9$DOY_end ,1,0)

testtest9<-aggregate(frost ~ country_nr + year, data=Data_overal9, FUN=sum)
str(testtest9)
names(testtest9)[2]<-"Year"
str(data_fao_pq)
library(plyr)
data_final9<-join(data_fao_pq,testtest9)




summary(data_final)



#top10 with pq as yield

#Yield model with year
model_pq = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq)

#Yield model with year temp -1
model_pq1 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final1, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))

summary(model_pq1)

#Yield model with year temp -2
model_pq2 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final2, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq2)

#Yield model with year temp -3
model_pq3 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final3, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq3)

#Yield model with year temp -4
model_pq4 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final4, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq4)

#Yield model with year temp -5
model_pq5 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final5, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq5)

#Yield model with year temp -6 
model_pq6 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final6, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq6)

#Yield model with year temp -7
model_pq7 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final7, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))

summary(model_pq7)

#Yield model with year temp -8
model_pq8 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final8, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq8)

#Yield model with year temp -9 
model_pq9 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = subset(data_final9, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France")))
summary(model_pq9)






fixest::coefplot(list(model_pq, model_pq1, model_pq2, model_pq3, model_pq4, model_pq5, model_pq6, model_pq7, model_pq8, model_pq9), col= sequential("steel blue3"), lwd = 2.5, horiz = TRUE, drop ="Year", dict =c(frost = "Frost days below different\n temperature thresholds"))


data = subset(data_final3, Area %in% c("China", "India", "Chile", "Turkey", "Italy", "United States", "Russia", "Poland", "Germany", "France"))


#Yield model with year
model_pq = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final)
summary(model_pq)

#Yield model with year temp -1
model_pq1 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final1)
summary(model_pq1)

#Yield model with year temp -2
model_pq2 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final2)
summary(model_pq2)

#Yield model with year temp -3
model_pq3 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final3)
summary(model_pq3)

#Yield model with year temp -4
model_pq4 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final4)
summary(model_pq4)

#Yield model with year temp -5
model_pq5 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final5)
summary(model_pq5)

#Yield model with year temp -6 
model_pq6 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final6)
summary(model_pq6)

#Yield model with year temp -7
model_pq7 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final7)
summary(model_pq7)

#Yield model with year temp -8
model_pq8 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final8)
summary(model_pq8)

#Yield model with year temp -9 
model_pq9 = feols(log(Yield) ~ frost + Year|Area, cluster = ~Area + Year, data = data_final9)
summary(model_pq9)



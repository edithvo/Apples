install.packages("vegperiod")
library(vegperiod)


Temp1 <- na.omit(Temp) 

vegperiod(dates=goe$date, Tavg=goe$t,
          start.method="ETCCDI", end.method="ETCCDI")



testb<-vegperiod(dates=Temp1$date[which(Temp1$country_nr==5 & Temp1$year==2000)], Tavg=Temp1$Taveg[which(Temp1$country_nr==5 & Temp1$year==2000)],
          start.method="ETCCDI", end.method="ETCCDI")
View(testb)

Temp2 <- Temp1

Temp2$Taveg<-ifelse(Temp2$Taveg>39.9,39.9,Temp2$Taveg)
Temp2$Taveg<-ifelse(Temp2$Taveg<(-34.9),(-34.9),Temp2$Taveg)

growing_season_start<-matrix(,ncol=length(spatial_centers), nrow=length(1990:2020))
growing_season_end<-matrix(,ncol=length(spatial_centers), nrow=length(1990:2020))

for (i in unique(Temp2$country_nr)){
  for (j in 1990:2020){
    temp_grow<-vegperiod(dates=Temp2$date[which(Temp2$country_nr==i & Temp2$year==j)], Tavg=Temp2$Taveg[which(Temp2$country_nr==i & Temp2$year==j)],
                         start.method="ETCCDI", end.method="ETCCDI")
    growing_season_start[which(1990:2020==j),i]<-temp_grow[1,2]
    growing_season_end[which(1990:2020==j),i]<-temp_grow[1,3]
    
  }
}

# melt both and join together 

End_melt <- melt(growing_season_end)
Start_melt <- melt(growing_season_start)
 
# Rename column END
names(End_melt)[names(End_melt) == "Var1"] <- "year"
names(End_melt)[names(End_melt) == "Var2"] <- "country_nr"
names(End_melt)[names(End_melt) == "value"] <- "DOY_end"

# Rename column START
names(Start_melt)[names(Start_melt) == "Var1"] <- "year"
names(Start_melt)[names(Start_melt) == "Var2"] <- "country_nr"
names(Start_melt)[names(Start_melt) == "value"] <- "DOY_start"


# add a column on the years  

End_melt2 <- cbind(1990:2020, End_melt)
Start_melt2 <- cbind(1990:2020, Start_melt)

colnames(End_melt2)[1] <- "year"
colnames(Start_melt2)[1] <- "year"

End_melt2[2] <- NULL 
Start_melt2[2] <- NULL 

#merge end and start dates in one dataframe
Growing_season <- merge(Start_melt2, End_melt2)


#merge Temp1 and growing season to have temperatures in dataframe as well
Data_overal <- merge(Temp1, Growing_season)
summary(Data_overal)

---------------------------------------------------------------------------

#frost yes or no
 Data_overal$DOY<- as.numeric(strftime(Data_overal$date, "%j"))
Data_overal$frost <- ifelse(Data_overal$Tmin<0 & Data_overal$DOY>Data_overal$DOY_start & Data_overal$DOY<Data_overal$DOY_end ,1,0)

testtest<-aggregate(frost ~ country_nr + year, data=Data_overal, FUN=sum)
str(testtest)
names(testtest)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final<-join(Data_fao,testtest)

# tmin < -1
#frost yes or no
Data_overal1 <- Data_overal
Data_overal1$frost <- ifelse(Data_overal1$Tmin< -1 & Data_overal1$DOY>Data_overal1$DOY_start & Data_overal1$DOY<Data_overal1$DOY_end ,1,0)

testtest1<-aggregate(frost ~ country_nr + year, data=Data_overal1, FUN=sum)
str(testtest1)
names(testtest1)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final1<-join(Data_fao,testtest1)



# tmin < -2
#frost yes or no
Data_overal2 <- Data_overal
Data_overal2$frost <- ifelse(Data_overal2$Tmin< -2 & Data_overal2$DOY>Data_overal2$DOY_start & Data_overal2$DOY<Data_overal2$DOY_end ,1,0)

testtest2<-aggregate(frost ~ country_nr + year, data=Data_overal2, FUN=sum)
str(testtest2)
names(testtest2)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final2<-join(Data_fao,testtest2)



# tmin < -3
#frost yes or no
Data_overal3 <- Data_overal
Data_overal3$frost <- ifelse(Data_overal3$Tmin< -3 & Data_overal3$DOY>Data_overal3$DOY_start & Data_overal3$DOY<Data_overal3$DOY_end ,1,0)

testtest3<-aggregate(frost ~ country_nr + year, data=Data_overal3, FUN=sum)
str(testtest3)
names(testtest3)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final3<-join(Data_fao,testtest3)



# tmin < -4
#frost yes or no
Data_overal4 <- Data_overal
Data_overal4$frost <- ifelse(Data_overal4$Tmin< -4 & Data_overal4$DOY>Data_overal4$DOY_start & Data_overal4$DOY<Data_overal4$DOY_end ,1,0)

testtest4<-aggregate(frost ~ country_nr + year, data=Data_overal4, FUN=sum)
str(testtest4)
names(testtest4)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final4<-join(Data_fao,testtest4)

# tmin < -5
#frost yes or no
Data_overal5 <- Data_overal
Data_overal5$frost <- ifelse(Data_overal5$Tmin< -5 & Data_overal5$DOY>Data_overal5$DOY_start & Data_overal5$DOY<Data_overal5$DOY_end ,1,0)

testtest5<-aggregate(frost ~ country_nr + year, data=Data_overal5, FUN=sum)
str(testtest5)
names(testtest5)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final5<-join(Data_fao,testtest5)

# tmin < -7
#frost yes or no
Data_overal7 <- Data_overal
Data_overal7$frost <- ifelse(Data_overal7$Tmin< -7 & Data_overal7$DOY>Data_overal7$DOY_start & Data_overal7$DOY<Data_overal7$DOY_end ,1,0)

testtest7<-aggregate(frost ~ country_nr + year, data=Data_overal7, FUN=sum)
str(testtest7)
names(testtest7)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final7<-join(Data_fao,testtest7)


# tmin < -6
#frost yes or no
Data_overal6 <- Data_overal
Data_overal6$frost <- ifelse(Data_overal6$Tmin< -6 & Data_overal6$DOY>Data_overal6$DOY_start & Data_overal6$DOY<Data_overal6$DOY_end ,1,0)

testtest6<-aggregate(frost ~ country_nr + year, data=Data_overal6, FUN=sum)
str(testtest6)
names(testtest6)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final6<-join(Data_fao,testtest6)

# tmin < -8
#frost yes or no
Data_overal8 <- Data_overal
Data_overal8$frost <- ifelse(Data_overal8$Tmin< -8 & Data_overal8$DOY>Data_overal8$DOY_start & Data_overal8$DOY<Data_overal8$DOY_end ,1,0)

testtest8<-aggregate(frost ~ country_nr + year, data=Data_overal8, FUN=sum)
str(testtest8)
names(testtest8)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final8<-join(Data_fao,testtest8)

# tmin < -9
#frost yes or no
Data_overal9 <- Data_overal
Data_overal9$frost <- ifelse(Data_overal9$Tmin< -9 & Data_overal9$DOY>Data_overal9$DOY_start & Data_overal9$DOY<Data_overal9$DOY_end ,1,0)

testtest9<-aggregate(frost ~ country_nr + year, data=Data_overal9, FUN=sum)
str(testtest9)
names(testtest9)[2]<-"Year"
summary(Data_fao)
str(Data_fao)
library(plyr)
data_final9<-join(Data_fao,testtest9)




summary(data_final)


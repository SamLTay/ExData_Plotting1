home<-"C:/users/samlt/Documents"
setwd(home)
setwd("c:./TSL/Coursera Data Science Caption/exdata_data_household_power_consumption")
f<-"household_power_consumption.txt"
t<-read.table(f,header=TRUE,sep=";")
t<-as.data.frame(t)
t$Date<-as.Date(t$Date,"%d/%m/%Y")
tsub<-t[(t$Date<as.Date("3/2/2007","%d/%m/%Y"))&(t$Date>=as.Date("1/2/2007","%d/%m/%Y")),]
tsubna<-tsub[which(tsub$Global_active_power!="?"),]
tsubna$Global_active_power<-as.numeric(as.character(tsubna$Global_active_power))
Gap<-tsubna$Global_active_power
png(file="plot1.png",width=480,height=480)
hist(Gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",breaks=13)
title(main="Global Active Power")
dev.off()



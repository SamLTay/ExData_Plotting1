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

png(file="plot2.png",width=480,height=480)
tsubDT<-mutate(tsub,dt=paste(as.character(Date),Time))
tsubDTna<-filter(tsubDT,Global_active_power!="?")
x<-as.POSIXlt(strptime(tsubDTna$dt,"%Y-%m-%d %H:%M:%S"))
y<-tsubDTna$Global_active_power
y<-as.numeric(as.character(y))
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()



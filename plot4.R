home<-"C:/users/samlt/Documents"
setwd(home)
setwd("c:./TSL/Coursera Data Science Caption/exdata_data_household_power_consumption")
f<-"household_power_consumption.txt"
t<-read.table(f,header=TRUE,sep=";")
t<-as.data.frame(t)
t$Date<-as.Date(t$Date,"%d/%m/%Y")
tsub<-t[(t$Date<as.Date("3/2/2007","%d/%m/%Y"))&(t$Date>=as.Date("1/2/2007","%d/%m/%Y")),]
tsubDT<-mutate(tsub,dt=paste(as.character(Date),Time))


#png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# 1
####
tsubDTna<-filter(tsubDT,Global_active_power!="?")
x<-as.POSIXlt(strptime(tsubDTna$dt,"%Y-%m-%d %H:%M:%S"))
y<-as.numeric(as.character(tsubDTna$Global_active_power))
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")
####
#2
tsubna<-tsub[which(tsub$Voltage!="?"),]
tsubDT<-mutate(tsubna,dt=paste(as.character(Date),Time))
x<-as.POSIXlt(strptime(tsubDT$dt,"%Y-%m-%d %H:%M:%S"))
y<-as.numeric(as.character(tsubna$Voltage))
plot(x,y,type="l",xlab="datetime",ylab="Voltage")
# # 3

tsubDTna<-filter(tsubDT,Sub_metering_1!="?")
tsubDTna<-filter(tsubDTna,Sub_metering_2!="?")
tsubDTna<-filter(tsubDTna,Sub_metering_3!="?")

x<-as.POSIXlt(strptime(tsubDTna$dt,"%Y-%m-%d %H:%M:%S"))
y1<-as.numeric(as.character(tsubDTna$Sub_metering_1))
y2<-as.numeric(as.character(tsubDTna$Sub_metering_2))
y3<-tsubDTna$Sub_metering_3
plot(x,y1,type="l",col="red",xlab="",ylab="Energy sub metering")
lines(x,y2,type="l",col="green")

lines(x,y3,type="l",col="blue")
legend("topright",lty=2,col=c("red","green","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 
tsubDTna<-filter(tsubDT,Global_reactive_power!="?")
x<-as.POSIXlt(strptime(tsubDTna$dt,"%Y-%m-%d %H:%M:%S"))
y<-as.numeric(as.character(tsubDTna$Global_reactive_power))
              
plot(x,y,type="l",col="purple",ylab="Global Reactive Power",xlab="datetime")
#dev.off()

import=read.table("household_power_consumption.txt",sep=";",header=T)
import$Date=as.Date(import$Date,"%d/%m/%Y")
import2=subset(import,import$Date=='2007-02-01'|import$Date=='2007-02-02')

#plot the 1st histogram
png('plot1.png')
hist(as.numeric(import2$Global_active_power)/1000,breaks=6,col='red'
     ,main="Global Active Power",xlab='Global Active Power (KiloWatt)')

dev.off()
#Plot the 2nd histogram
png('plot2.png')
x<-paste(import2$Date,import2$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
plot(x,as.numeric(import2$Global_active_power)/1000,'l',ylab="Global Active Power (kilowatts)")
dev.off()

#Plot the 3rd plot
sub1<-import2$Sub_metering_1
sub2<-import2$Sub_metering_2
sub3<-import2$Sub_metering_3
png('plot3.png')
plot(x,sub1,'l',col='black')
lines(x,sub2,col='red')
lines(x,sub3,col='blue')

legend(x[length(x)-1500],max(as.numeric(sub1))-2,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,cex=0.8,col=c("black","red","blue"),lty=1)
dev.off()
#Plot the 4th Plot
png('Plot4.png')
par(mfrow=c(2,2))
plot(x,as.numeric(import2$Global_active_power)/1000,'l')
plot(x,import2$Voltage,'l')
plot(x,sub1,'l',col='black')
lines(x,sub2,col='red')
lines(x,sub3,col='blue')

legend(x[length(x)-1500],max(as.numeric(sub1))-2,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,cex=0.8,col=c("black","red","blue"),lty=1)

dev.off()

png('plot5.png')
plot(x,import2$Global_reactive_power,'l',ylab='Global_reactive_power')
dev.off()

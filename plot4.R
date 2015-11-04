rm(list=ls());
df<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings="?");
df<-subset(df,(Date=="1/2/2007"|Date=="2/2/2007"));
df$Date<-format.Date(strptime(df$Date,"%d/%m/%Y"),"%Y-%m-%d");
days<-format.Date(strptime(df$Date[1],"%Y-%m-%d"),"%a");
days<-c(days,"Fri","Sat");
pnts<-c(1,(1+length(df$Date)/2),1+length(df$Date));
#
par(mfrow=c(2,2));

plot(df$Global_active_power,type="l",xlim=c(1,pnts[3]),xlab="",xaxt="n",ylab="Global Active Power");
axis(1,at=pnts,labels=days);

plot(df$Voltage,type="l",xlim=c(1,pnts[3]),xlab="datetime",xaxt="n",ylab="Voltage");
axis(1,at=pnts,labels=days);

ymax<-max(subset(df,select=(Sub_metering_1:Sub_metering_3)));
plot(df$Sub_metering_1,xlim=c(1,pnts[3]),ylim=c(0,ymax),type="n",xlab="",xaxt="n",ylab="Energy sub metering");
lines(df$Sub_metering_1,col="black");
lines(df$Sub_metering_2,col="red");
lines(df$Sub_metering_3,col="blue");
legend("topright",inset=0.0,bty="n",cex=1.0,lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "));
axis(1,at=pnts,labels=days);

plot(df$Global_reactive_power,type="l",xlim=c(1,pnts[3]),xlab="datetime",xaxt="n",ylab="Global_reactive_power");
axis(1,at=pnts,labels=days);


dev.copy(png,filename ="plot4.png",width=480,height=480,units="px");
dev.off();

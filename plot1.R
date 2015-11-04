rm(list=ls());
df<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings="?");
df<-subset(df,(Date=="1/2/2007"|Date=="2/2/2007"));
df$Date<-format.Date(strptime(df$Date,"%d%m%Y"),"%Y-%m-%d");
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.copy(png,filename="plot1.png",width=480,height=480,units="px");
dev.off()

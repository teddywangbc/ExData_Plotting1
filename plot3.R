
raw_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";")

data<-rbind(subset(raw_data,raw_data$Date=="1/2/2007"),subset(raw_data,raw_data$Date=="2/2/2007"))

data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date,format="%d/%m/%Y %H:%M:%S")
data$Time<-NULL

data[,2:8]<-sapply(data[,2:8],as.numeric)


plot(data$Date,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2,type="l",col="red")
lines(data$Date,data$Sub_metering_3,type="l",col="blue")


legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.35)


dev.copy(png,"plot3.png")
dev.off()

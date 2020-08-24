raw_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";")

data<-rbind(subset(raw_data,raw_data$Date=="1/2/2007"),subset(raw_data,raw_data$Date=="2/2/2007"))

data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date,format="%d/%m/%Y %H:%M:%S")
data$Time<-NULL

data[,2:8]<-sapply(data[,2:8],as.numeric)

plot(data$Date,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,"plot2.png")
dev.off()
raw_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";")
data<-rbind(subset(raw_data,raw_data$Date=="1/2/2007"),subset(raw_data,raw_data$Date=="2/2/2007"))

data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date,format="%d/%m/%Y %H:%M:%S")
data$Time<-NULL

data[,2:8]<-sapply(data[,2:8],as.numeric)


hist(data$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab="Frequency")

dev.copy(png,"plot1.png")
dev.off()


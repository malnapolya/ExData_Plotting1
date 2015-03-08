plot1 <- function() {
	data<-read.table("data/household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrow=2880)
	names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-cbind(data,DateTime=strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S"))
	png(file="plot1.png")
	hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.off()
	
}
plot2 <- function() {
	data<-read.table("data/household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrow=2880)
	names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-cbind(data,DateTime=strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S"))
	Sys.setlocale("LC_TIME", "English")	
	png(file="plot2.png")
	with(data,plot(Global_active_power~DateTime,col="black",xlab="",ylab="Global Active Power (kilowatts)",type="n"))
	with(data,lines(Global_active_power~DateTime,col="black"))
	dev.off()
	
}
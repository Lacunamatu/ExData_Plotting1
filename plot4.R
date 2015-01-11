file<- "./data/Explore_Data_Prj1/household_power_consumption.txt"
electricity<-read.table(file,header=TRUE, sep=";", na.strings = "?", 
                        stringsAsFactors=FALSE)
electricity$DateTime <- paste(electricity$Date, electricity$Time)
electricity$DateTime <- strptime(electricity$DateTime, 
                                 format = "%d/%m/%Y %H:%M:%S")

data<-electricity[format(electricity$DateTime, "%Y-%m-%d") == "2007-02-01"
                  | format(electricity$DateTime, "%Y-%m-%d") == "2007-02-02",]

##Plot #4
par(mfcol=c(2,2),mar=c(4,4,2,1),cex=.7)
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power (Kilowatts)",xlab="")
with(data,plot(DateTime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="",col="black") )
with(data,lines(DateTime,Sub_metering_2, type="l",ylab="Energy sub metering",xlab="",col="Red") )
with(data,lines(DateTime,Sub_metering_3, type="l",ylab="Energy sub metering",xlab="",col="blue") )
legend("topright",lty=c(1,1),bty="n",col=c("black","red","blue"),legend= c("sub_metering_1","sub_metering_2","sub_metering_3"), y.intersp=.4,text.width=75000)
plot(data$DateTime,data$Voltage, type="l",ylab="Voltage",xlab="datetime")
plot(data$DateTime,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
##print to png file 
dev.copy(png,file="plot4.png")
dev.off()
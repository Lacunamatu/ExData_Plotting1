## Plot 3.R

## Reading Dataset:
file<- "./data/Explore_Data_Prj1/household_power_consumption.txt"
electricity<-read.table(file,header=TRUE, sep=";", na.strings = "?", 
                        stringsAsFactors=FALSE)
## Merging and changing variable type of Date and Time from Character to Date:
electricity$DateTime <- paste(electricity$Date, electricity$Time)
electricity$DateTime <- strptime(electricity$DateTime, 
                                 format = "%d/%m/%Y %H:%M:%S")

## selecting Feb 1,2007 & Feb 2,2007 Data:
data<-electricity[format(electricity$DateTime, "%Y-%m-%d") == "2007-02-01"
                  | format(electricity$DateTime, "%Y-%m-%d") == "2007-02-02",]
## Plot 3:
par(cex=1)
with(data,plot(DateTime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="",col="black") )
with(data,lines(DateTime,Sub_metering_2, type="l",ylab="Energy sub metering",xlab="",col="Red") )
with(data,lines(DateTime,Sub_metering_3, type="l",ylab="Energy sub metering",xlab="",col="blue") )
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend= c("sub_metering_1","sub_metering_2","sub_metering_3"), y.intersp=.4,cex=.5,text.width=25000)
dev.copy(png,file="plot3.png")
dev.off()
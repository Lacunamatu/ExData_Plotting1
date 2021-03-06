## Plot 2.R

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
## Plot 2:
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power (Kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
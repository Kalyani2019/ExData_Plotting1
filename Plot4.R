
###Read data
data <- read.table("/DataScience-Capstone/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##
png("plot4.png")
par(mfrow=c(2,2))

with(
  data1,{
    plot(datetime,as.numeric(as.character(data1$Global_active_power)),       type="l",  xlab="",ylab="Global Active Power")  
    plot(datetime,as.numeric(as.character(data1$Voltage)),              type="l",xlab="",ylab="Voltage")
    plot(datetime,as.numeric(data1$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
    with(data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(datetime,as.numeric(as.character(data1$Global_reactive_power)),type="l",xlab="",ylab="Global_reactive_power")
  })
dev.off()

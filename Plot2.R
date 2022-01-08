
###Read data
data <- read.table("/DataScience-Capstone/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(data1$Global_active_power)

##
png("plot2.png")
plot(datetime,  
     activepower,
     type = "l", 
     xlab = NA,  
     ylab = "Global Active Power")
dev.off()

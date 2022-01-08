
###Read data
data <- read.table("/DataScience-Capstone/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the \color{red}{\verb|strptime()|}strptime()  and \color{red}{\verb|as.Date()|}as.Date() functions.
data2 <- as.character(as.Date(data1$Date, "%d/%m/%Y"))
data2a <- strptime(data1$Date, "% H:% M:% S")
data2b <- strptime(data2a, "%Y-%m-%d %H:%M:%S")

##
data2c <- na.omit(data)
str(data2c)

png("plot1.png", width = 480, height = 480)
hist(as.numeric(data2c$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

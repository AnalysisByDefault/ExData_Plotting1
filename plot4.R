classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.string="?", colClasses=classes, comment.char="")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]

png(file="plot4.png", bg="transparent", height=480, width=480)
par(mfrow=c(2,2))
plot(data[,2:3], type="l", xlab="", ylab="Global Active Power")
plot(data[,c(2,5)], type="l", xlab="datetime", ylab="Voltage")
plot(data[,c(2,7)], type="n", xlab="", ylab="Energy sub metering")
lines(data[,c(2,7)], col="black")
lines(data[,c(2,8)], col="red")
lines(data[,c(2,9)], col="blue")
legend("topright", bty="n", lty="solid", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data[,c(2,4)], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

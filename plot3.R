classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.string="?", colClasses=classes, comment.char="")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]

png(file="plot3.png", bg="transparent", width=480, height=480)
plot(data$Time, data[[7]], type="n", xlab="", ylab="Energy sub metering")
lines(data$Time, data[[7]], col="black")
lines(data$Time, data[[8]], col="red")
lines(data$Time, data[[9]], col="blue")
legend("topright", lty="solid", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

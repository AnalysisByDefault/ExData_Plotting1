classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.string="?", colClasses=classes, comment.char="")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]

png(file="plot1.png", bg="transparent")
hist(data[,3], col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", pin=c(480,480))
dev.off()

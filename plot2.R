classes <- c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.string="?", colClasses=classes, comment.char="")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]

png(file="plot2.png", bg="transparent", height=480, width=480)
plot(data[,2:3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

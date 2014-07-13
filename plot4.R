
df <- read.table("../household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

subData <- subset(df, Date %in% dates)

png("plot4.png",width=480,height=480)

par(mfrow = c(2,2))

plot(subData$Time, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(subData$Time, subData$Voltage, type="l", xlab="datatime", ylab="Voltage")

plot(subData$Time, subData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subData$Time, subData$Sub_metering_2, col="red")
lines(subData$Time, subData$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,box.lwd=0)

plot(subData$Time, subData$Global_reactive_power,  type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subData$Time, subData$Global_reactive_power)

dev.off()
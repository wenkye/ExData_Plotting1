
df <- read.table("../household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

subData <- subset(df, Date %in% dates)

plot(subData$Time, subData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subData$Time, subData$Sub_metering_2, col="red")
lines(subData$Time, subData$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"),lwd=1)
dev.copy(png,file="plot3.png")
dev.off()
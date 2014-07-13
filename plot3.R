rm(list=ls())
#Load data into R
df <- read.table("../household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

#convert to Date/Time classes
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

#only load data between 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subData <- subset(df, Date %in% dates)

png("plot3.png",width=480,height=480)
plot(subData$Time, subData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subData$Time, subData$Sub_metering_2, col="red")
lines(subData$Time, subData$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"),lwd=1)

#close device
dev.off()
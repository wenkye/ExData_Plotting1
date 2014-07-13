
df <- read.table("../household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

subData <- subset(df, Date %in% dates)

png("plot1.png", width=480, height=480)

plot(subData$Time, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

dev.off()
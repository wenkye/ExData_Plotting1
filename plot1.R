
#Load data into R
df <- read.table("../household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

#convert to Date/Time classes
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

#only load data between 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subData <- subset(df, Date %in% dates)

#create plot 1
png("plot1.png", width=480, height=480)
hist(subData[,3], col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close device
dev.off()
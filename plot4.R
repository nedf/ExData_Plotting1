require("data.table")
rawdata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses=c("Date", "character", "character", "character", "character", "character", "character", "character", "character"))
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02" ]

data$Global_active_power <- as.numeric(data$Global_active_power)
x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(x, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(x, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(x, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(x, data$Sub_metering_2, type="l", col="red")
points(x, data$Sub_metering_3, type="l", col="blue")

legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=1, lty=1, col=c("black", "red", "blue"), cex=0.5)

plot(x, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

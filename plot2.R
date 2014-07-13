require("data.table")
rawdata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses=c("Date", "character", "character", "character", "character", "character", "character", "character", "character"))
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02" ]

data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#png("plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#dev.off()

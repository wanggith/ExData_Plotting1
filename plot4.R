data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- data_sub$Sub_metering_1
sub_metering_2 <- data_sub$Sub_metering_2
sub_metering_3 <- data_sub$Sub_metering_3
voltage <- data_sub$Voltage
global_reactive_power <- data_sub$Global_reactive_power
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(datetime, global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()
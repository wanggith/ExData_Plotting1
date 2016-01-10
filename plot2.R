data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- data_sub$Global_active_power
png(filename="C:\Users\frankwang\ExData_Plotting1\plot2.png", width=480, height=480, units="px")
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
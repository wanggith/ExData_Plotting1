data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
global_active_power <- data_sub$Global_active_power
png(filename="plot1.png", width=480, height=480, units="px")
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
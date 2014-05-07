unzip("exdata-data-household_power_consumption.zip")
Plotting1 <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", 
                        col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, 
                        header = TRUE, sep=";")))

Plotting1$Date.Time <- paste(Plotting1$Date, Plotting1$Time)
Plotting1$Date.Time1 <- strptime(Plotting1$Date.Time, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

png(file = "plot4.png", width = 480, height = 480)
par(mfrow= c(2, 2))
plot(Plotting1$Date.Time1, Plotting1$Global_active_power, type = "l", ylab= "Global Active Power", xlab="")
plot(Plotting1$Date.Time1, Plotting1$Voltage, type = "l", ylab= "Voltage", xlab= "datetime")
plot(Plotting1$Date.Time1, Plotting1$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab="")
lines(Plotting1$Date.Time1, Plotting1$Sub_metering_1, type = "l", col= "black")
lines(Plotting1$Date.Time1, Plotting1$Sub_metering_2, type = "l", col= "red")
lines(Plotting1$Date.Time1, Plotting1$Sub_metering_3, type = "l", col= "blue")
legend("topright", lwd, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col= c("black", "red", "blue"))
plot(Plotting1$Date.Time1, Plotting1$Global_reactive_power,type = "l", ylab= "Global_reactive_power", xlab ="datetime")
dev.off()

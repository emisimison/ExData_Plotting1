unzip("exdata-data-household_power_consumption.zip")
Plotting1 <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", 
                        col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, 
                        header = TRUE, sep=";")))

Plotting1$Date.Time <- paste(Plotting1$Date, Plotting1$Time)
Plotting1$Date.Time1 <- strptime(Plotting1$Date.Time, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")


png(file = "plot2.png", width = 480, height = 480)
plot(Plotting1$Date.Time1, Plotting1$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()
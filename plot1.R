unzip("exdata-data-household_power_consumption.zip")
Plotting1 <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", 
                      col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, 
                      header = TRUE, sep=";")))
png(file = "plot1.png", width = 480, height = 480)
hist(Plotting1$Global_active_power, breaks = 15, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

# read the data
all_data <- read.csv("household_power_consumption.txt", sep = ";", 
                     na.strings = "?")
data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]

datetime_str <- paste(data[, "Date"], data[, "Time"])
datetime <- strptime(datetime_str, format = "%e/%m/%Y %H:%M:%S")

# plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
        plot(datetime, Global_active_power, type = "l",
             xlab = "", ylab = "Global Active Power")
        plot(datetime, Voltage, type = "l", ylab = "Voltage")
        plot(datetime, Sub_metering_1, type = "l",
             xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col = c("black", "red", "blue"), 
               lty = 1, cex = 0.75, bty = "n")
        plot(datetime, Global_reactive_power, type = "l")
})

# save as png file
#dev.copy(png, file="plot4.png", width = 480, height = 480)
# dev.copy doesn't return the same plot as it shows in RStudio v0.98.1091
# on Mac OS X Yosemite v10.10.1 (14B25), 
# seems to be a bug
dev.off()

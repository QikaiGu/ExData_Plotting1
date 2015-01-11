# read the data
all_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]

datetime_str <- paste(data[, "Date"], data[, "Time"])
datetime <- strptime(datetime_str, format="%e/%m/%Y %H:%M:%S")

# plot
plot(datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# save as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

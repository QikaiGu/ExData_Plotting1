# read the data
all_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]

# plot
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# save as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

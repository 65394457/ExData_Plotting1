# save space read in 5000 lines then subset for exact dataset

df <- read.table("household_power_consumption.txt", sep=";", skip=65000, nrows=5000)
data <- subset(df, V1 =="1/2/2007" | V1 == "2/2/2007")

# join the dates and times together

times <- strptime(paste(data$V1, data$V2, sep=" "), "%d/%m/%Y %H:%M:%S")

# specify graphics device and dimensions

png('plot2.png', width=480, height=480)
plot(times, data$V3, type ="l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.off()
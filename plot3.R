# save space read in 5000 lines then subset for exact dataset

df <- read.table("household_power_consumption.txt", sep=";", skip=65000, nrows=5000)
data <- subset(df, V1 =="1/2/2007" | V1 == "2/2/2007")

# join the dates and times together

times <- strptime(paste(data$V1, data$V2, sep=" "), "%d/%m/%Y %H:%M:%S")

# specify graphics device and dimensions

png('plot3.png', width=480, height=480)
plot(times, data$V7, type="l", xlab=" ", ylab="Energy sub metering")

# add lines and legend

lines(times, data$V8, type="l", col="red")
lines(times, data$V9, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, lwd=1)

dev.off()
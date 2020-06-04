# save space read in 5000 lines then subset for exact dataset

df <- read.table("household_power_consumption.txt", sep=";", skip=65000, nrows=5000)
data <- subset(df, V1 =="1/2/2007" | V1 == "2/2/2007")

# colour seems be be burnt orange
# specify graphics device and dimensions

png('plot1.png', width=480, height=480)
with(data, hist(V3, col="#FF3300", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

dev.off()
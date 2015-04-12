#read data file
currentloc <- getwd()
hpc <- read.table(paste0(currentloc, "/data/household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors=FALSE)

#select required dates
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
shpc <- hpc[which((hpc$Date == "2007-02-01")|(hpc$Date == "2007-02-02")),]

#plot graphs to PNG file
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
plot(shpc$Time, shpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(shpc$Time, shpc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(shpc$Time, shpc$Sub_metering_2, col="red")
lines(shpc$Time, shpc$Sub_metering_3, col="blue")
legend("topright", names(shpc[,7:9]), lty=1, col=c("black","red","blue"), bty="n", cex=.75)
plot(shpc$Time, shpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(shpc$Time, shpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

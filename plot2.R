#read data file
currentloc <- getwd()
hpc <- read.table(paste0(currentloc, "/data/household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors=FALSE)

#select required dates
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
shpc <- hpc[which((hpc$Date == "2007-02-01")|(hpc$Date == "2007-02-02")),]

#plot graph to PNG file
png("plot2.png", width=480, height=480)
plot(shpc$Time, shpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

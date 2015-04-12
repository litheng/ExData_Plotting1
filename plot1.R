#read data file
currentloc <- getwd()
hpc <- read.table(paste0(currentloc, "/data/household_power_consumption.txt"), header=TRUE, sep = ";", stringsAsFactors=FALSE)

#select required dates
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
shpc <- hpc[which((hpc$Date == "2007-02-01")|(hpc$Date == "2007-02-02")),]

#plot graph to PNG file
GAP <- as.numeric(shpc$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

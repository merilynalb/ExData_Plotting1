##Preparing data
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1,
                  col.names = c("Date", "Time", "Global_active_power", 
                                "Global_reactive_power", "Voltage", 
                                "Global_intensity", "Sub_metering_1", 
                                "Sub_metering_2", "Sub_metering_3"))
subDates <- subset(EPC, EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007") 

##Change class of columns 
DateTime <- as.POSIXct(paste(subDates$Date, subDates$Time), 
                       format = "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subDates$Sub_metering_1)
subMetering2 <- as.numeric(subDates$Sub_metering_2)
subMetering3 <- as.numeric(subDates$Sub_metering_3)

##Plot Graph 3
png("plot3.png", width = 480, height = 480)
plot(DateTime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(DateTime, subMetering2, type = "l", col = "red")
lines(DateTime, subMetering3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()

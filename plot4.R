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
Globalactivepower <- as.numeric(subDates$Global_active_power)
Globalreactivepower <- as.numeric(subDates$Global_reactive_power)
Voltagenew <- as.numeric(subDates$Voltage)
subMetering1 <- as.numeric(subDates$Sub_metering_1)
subMetering2 <- as.numeric(subDates$Sub_metering_2)
subMetering3 <- as.numeric(subDates$Sub_metering_3)

##Plot Graph 4
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(5,6,2,2))

with(subDates, plot(DateTime, Globalactivepower,
                    ylab = "Global Active Power",
                    xlab = "",
                    type = "l")) ##top left graph

with(subDates, plot(DateTime, subMetering1, type = "l", xlab = "",
                    ylab = "Energy sub metering"))
lines(DateTime, subMetering2, type = "l", col = "red")
lines(DateTime, subMetering3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2.5, cex = 0.5) ##bottom left graph

with(subDates, plot(DateTime, Voltagenew, type = "l", xlab = "datetime",
                    ylab = "Voltage")) ##top right graph

with(subDates, plot(DateTime, Globalreactivepower, type = "l", xlab = "datetime",
                    ylab = "Global_reactive_power"))
dev.off()

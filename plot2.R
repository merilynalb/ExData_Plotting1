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

##Plot Graph 2
png("plot2.png", width = 480, height = 480)
with(subDates, plot(DateTime, Globalactivepower,
                    ylab = "Global Active Power (kilowatts)",
                    xlab = "",
                    type = "l"))
dev.off()

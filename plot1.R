##Preparing data
filetxt <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(filetxt, destfile = "/Users/meri/Documents/Coursera/4 Exploratory Data Analysis/Week 1/Electric Power Consumption.zip", method = "curl")
unzip("Electric Power Consumption.zip")
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1,
                  col.names = c("Date", "Time", "Global_active_power", 
                                "Global_reactive_power", "Voltage", 
                                "Global_intensity", "Sub_metering_1", 
                                "Sub_metering_2", "Sub_metering_3"))
subDates <- subset(EPC, EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007") 

##Change class of columns Date and Global Active Power
subDates$Date <- as.Date(subDates$Date, format = "$d/%m/%Y")
subDates$Global_active_power <- as.numeric(subDates$Global_active_power)

##Plot Graph 1
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1,1), mar = c(4,4,2,2))
hist(subDates$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off() 

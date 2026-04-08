install.packages("data.table")
library(data.table)
install.packages("lubridate")
library(lubridate)
install.packages("hms")
library(hms)



f <- file.path(getwd(),"/household_power_consumption.txt")
power_cons <- fread(file = f, sep = ";", na.strings = '?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_cons <- power_cons[complete.cases(power_cons),]
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons <- subset(power_cons, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
####

par(mfrow = c(2,2))




# power_cons$Date <- dmy(power_cons$Date)
# power_cons$Time <- as.hms(power_cons$Time)
# power_cons$Global_active_power <- as.numeric(power_cons$Global_active_power)               
# power_cons$Global_reactive_power <- as.numeric(power_cons$Global_reactive_power)    
# power_cons$Global_intensity <- as.numeric(power_cons$Global_intensity)
# power_cons$Voltage <- as.numeric(power_cons$Voltage)
# power_cons$Sub_metering_1 <- as.numeric(power_cons$Sub_metering_1)
# power_cons$Sub_metering_2 <- as.numeric(power_cons$Sub_metering_2)
# power_cons$Sub_metering_3 <- as.numeric(power_cons$Sub_metering_3)
# 
# 
# 
#         
# options(scipen = 999)
# hist(power_cons$Global_active_power, col = "red", 
#      xlab = "Global Active Power (kilowatts)", 
#      main = "Global Active Power")
#         
        
        
        
        
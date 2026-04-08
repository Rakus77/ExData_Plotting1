# install.packages("data.table")
# library(data.table)
# install.packages("lubridate")
# library(lubridate)
# install.packages("hms")
# library(hms)
# install.packages("dplyr")
# library(dplyr)

par(mfrow = c(1,1))

f <- file.path(getwd(),"/household_power_consumption.txt")
power_cons <- fread(file = f, sep = ";", na.strings = '?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_cons <- power_cons[complete.cases(power_cons),]
power_cons <- as.data.frame(power_cons)
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons_sub <- subset(power_cons, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

power_cons_sub$DateTime <- paste(power_cons_sub$Date, power_cons_sub$Time)

power_cons_sub$DateTimeStrp <- strptime(power_cons_sub$DateTime, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

DateNumber <- as.numeric(power_cons_sub$DateTimeStrp)

png(filename = "./plot2.png", width = 480, height = 480, units = 'px', bg = "white")

plot(power_cons_sub$DateTimeStrp,power_cons_sub$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

axis(1, at = c(DateNumber[1],DateNumber[1440],DateNumber[2880]), labels = c("Thu", "Fri", "Sat"))

dev.off()
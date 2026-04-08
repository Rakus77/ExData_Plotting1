# install.packages("data.table")
# library(data.table)
# install.packages("lubridate")
# library(lubridate)
# install.packages("hms")
# library(hms)
# install.packages("dplyr")
# library(dplyr)


f <- file.path(getwd(),"/household_power_consumption.txt")
power_cons <- fread(file = f, sep = ";", na.strings = '?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_cons <- power_cons[complete.cases(power_cons),]
power_cons <- as.data.frame(power_cons)
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons_sub <- subset(power_cons, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

power_cons_sub$DateTime <- paste(power_cons_sub$Date, power_cons_sub$Time)

power_cons_sub$DateTimeStrp <- strptime(power_cons_sub$DateTime, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

DateNumber <- as.numeric(power_cons_sub$DateTimeStrp)

#par(cex = 1)

png(filename = "./plot4.png", width = 480, height = 480, units = 'px', bg = "white")

par(mfcol = c(2,2))


plot(power_cons_sub$DateTimeStrp,power_cons_sub$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at = c(DateNumber[1],DateNumber[1440],DateNumber[2880]), labels = c("Thu", "Fri", "Sat"))



plot(power_cons_sub$DateTimeStrp,power_cons_sub$Sub_metering_1,type = "l", xlab = "", ylab = "Energy Sub Metering", xaxt = "n")
lines(power_cons_sub$DateTimeStrp,power_cons_sub$Sub_metering_2,type = "l", col = "red")
lines(power_cons_sub$DateTimeStrp,power_cons_sub$Sub_metering_3,type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd = 1, lty = 1, col = c("black","red", "blue" ), cex = 0.9, pt.cex = 2, bty = "n", y.intersp = .9)
axis(1, at = c(DateNumber[1],DateNumber[1440],DateNumber[2880]), labels = c("Thu", "Fri", "Sat"))


plot(power_cons_sub$DateTimeStrp,power_cons_sub$Voltage,type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(DateNumber[1],DateNumber[1440],DateNumber[2880]), labels = c("Thu", "Fri", "Sat"))


plot(power_cons_sub$DateTimeStrp,power_cons_sub$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_Reactive_Power", xaxt = "n")
axis(1, at = c(DateNumber[1],DateNumber[1440],DateNumber[2880]), labels = c("Thu", "Fri", "Sat"))


dev.off()



        